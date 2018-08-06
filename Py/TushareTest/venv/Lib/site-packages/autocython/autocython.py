#####################################################################
#                                                                   #
# autocython.py                                                     #
#                                                                   #
# Copyright 2018, Chris Billington                                  #
#                                                                   #
# This file is part of the autocython project (see                  #
# https://bitbucket.org/cbillington/autocython) and is licensed     #
# under  the Simplified BSD License. See the license.txt file in    #
# the root of the project for the full license.                     #
#                                                                   #
#####################################################################

from __future__ import print_function, unicode_literals, division, absolute_import
import sys
import os
import platform
import importlib
import json
import shutil
import hashlib
PY2 = sys.version_info.major == 2
if PY2:
    str = unicode

if PY2 and not sys.version_info.minor == 7:
    raise RuntimeError("Only Python 2 version supported is 2.7")
if sys.version_info.major == 3 and sys.version_info.minor < 5:
    raise RuntimeError("Minimum supported Python 3 is 3.5")


if PY2:
    PLATFORM_SUFFIX = b'_py27_{}_{}'.format(sys.platform,
                                            platform.architecture()[0])
else:
    PLATFORM_SUFFIX = ''


def file_hash(filename):
    h = hashlib.sha256()
    with open(filename, 'rb', buffering=0) as f:
      for b in iter(lambda : f.read(128*1024), b''):
        h.update(b)
    return h.hexdigest()


def compute_hashes(folder, pyx_files, so_files):
    hashes = {}
    setup_py = os.path.join(folder, 'setup.py')
    setup_hash = file_hash(setup_py)
    for pyx_file, so_file in zip(pyx_files, so_files):
        if os.path.exists(so_file):
            so_relpath = os.path.split(so_file)[1]
            hashes[so_relpath] = {'pyx': file_hash(pyx_file),
                                  'so': file_hash(so_file),
                                  'setup.py': setup_hash}
    return hashes


def get_last_compile_state(folder):
    try:
        with open(os.path.join(folder, 'autocython_compile_state.json'), 'r') as f:
            return json.load(f)
    except (IOError, ValueError):
        return {}


def save_compile_state(folder, compile_state):
    with open(os.path.join(folder, 'autocython_compile_state.json'), 'w') as f:
        json.dump(compile_state, f, indent=4, sort_keys=True)


def hashes_valid(folder, pyx_files, so_files):
    """Check if the compiled extensions are valid, by comparing the hash of the pyx
    files and so files, as well as setup.py, at last compilation to what they are
    now. Return False if any so file does not exist or has a different hash"""
    compile_state = get_last_compile_state(folder)
    current_state = compute_hashes(folder, pyx_files, so_files)
    for so_file in so_files:
        so_relpath = os.path.split(so_file)[1]
        if so_relpath not in compile_state or so_relpath not in current_state:
            return False
        if current_state[so_relpath] != compile_state[so_relpath]:
            return False
    return True


def update_hashes(folder, pyx_files, so_files):
    compile_state = get_last_compile_state(folder)
    current_state = compute_hashes(folder, pyx_files, so_files)
    for so_relpath in list(compile_state.keys()):
        if not os.path.exists(os.path.join(folder, so_relpath)):
            del compile_state[so_relpath]
    compile_state.update(current_state)
    save_compile_state(folder, compile_state)


def compile_extensions(folder, names):
    """Run setup.py to compile the extensions inplace, then remove the build
    directory and the generated C files"""
    current_folder = os.getcwd()
    try:
        os.chdir(folder)
        cmd = sys.executable + " setup.py build_ext --inplace"
        if os.name == 'nt':
            cmd += ' --compiler=msvc'
        if os.system(cmd) != 0:
            msg = """Couldn't compile cython extension. If you are on Windows,
                  ensure you have the following conda packages: libpython, cython,
                  and have installed the appropriate Microsoft Visual C or Visual
                  Studio Build Tools for your version of Python. If on another
                  platform, ensure you have gcc and cython, from conda or
                  otherwise. See above for the specific error that occured. In
                  addition, it is crucial that your setup.py has a 'import
                  setuptools' line before importing anything from distutils, as
                  setuptools patches distutils in order to be able to find the
                  Microsoft compilers on Windows."""
            msg = ' '.join(s.strip() for s in msg.splitlines())
            raise RuntimeError(msg)
        try:
            shutil.rmtree('build')
        except Exception:
            pass
        for name in names:
            extension_c = os.path.join(folder, name + '.c')
            try:
                os.unlink(extension_c)
            except Exception:
                pass
    finally:
        os.chdir(current_folder)


def ensure_extensions_compiled(folder, names=None):
    """Ensure the Cython extensions in the given folder with the given list of
    names are compiled, and if not (or if they are in need of recompilation),
    compile them by running ``setup.py`` (assumed to be in the same folder). If no
    names are given, they will be inferred from any ``.pyx`` files in the folder.
    It is assumed that each cython file is called ``<name>.pyx``, and that each
    extension (as specified in ``setup.py``) is called ``<name><PLATFORM_SUFFIX>``,
    where :attr:`~autocython.PLATFORM_SUFFIX` is a constant defined in this
    module that specifies the platform details for Python 2, allowing
    :func:`~autocython.import_extension` to import the correct version of
    the extension if multiple versions exist for different platforms. In Python
    3 :attr:`~autocython.PLATFORM_SUFFIX` is the empty string since Python 3
    does a similar thing automatically."""

    from distutils.sysconfig import get_config_var
    if isinstance(names, str) or isinstance(names, bytes):
        names = [names]
    if names is None:
        names = [os.path.splitext(name)[0]
                 for name in os.listdir(folder)
                 if name.endswith('.pyx')]
    pyx_files = []
    so_files = []
    for name in names:
        extension_pyx = os.path.join(folder, name + '.pyx')
        extension_so = os.path.join(folder, name)
        ext_suffix = get_config_var('EXT_SUFFIX')
        if ext_suffix is None:
            ext_suffix = '.pyd' if os.name == 'nt' else '.so'
        extension_so = extension_so + PLATFORM_SUFFIX + ext_suffix
        pyx_files.append(extension_pyx)
        so_files.append(extension_so)
    if not hashes_valid(folder, pyx_files, so_files):
        msg = "Extension(s) out of date, recompiling...\n"
        sys.stderr.write(msg)
        compile_extensions(folder, names)
        update_hashes(folder, pyx_files, so_files)


def import_extension(fullname):
    """Import the extension, after appending :attr:`~autocython.PLATFORM_SUFFIX` in
    order to ensure we get the right version for our platform. This is not
    neccesary on Python 3, which does a similar thing automatically if you use an
    ordinary import (On Python 3 :attr:`~autocython.PLATFORM_SUFFIX` is an empty
    string). ``fullname`` must be a fully qualified, absolute import. This function
    also inserts the module into sys.modules under the name fullname, and hence it
    will be available for ordinary import without this function, so long as this
    function is called once first (say in the ``__init__.py`` of the package)"""
    name = fullname + PLATFORM_SUFFIX
    module = importlib.import_module(name)
    # Make available to ordinary imports:
    sys.modules[fullname] = module
    return module