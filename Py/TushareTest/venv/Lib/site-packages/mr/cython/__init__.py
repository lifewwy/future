import os
import sys
import logging
import subprocess
import pkg_resources
from zc.buildout import easy_install

FAKE_PART_ID = "_mr.cython"

# FIXME: should retrieve from z.b.easy_install, and patch
runsetup_template = """
import sys
sys.path.insert(0, %(setupdir)r)
sys.path.insert(0, @CYTHON@)
sys.path.insert(0, %(setuptools)r)

import os, setuptools

__file__ = %(__file__)r

os.chdir(%(setupdir)r)
sys.argv[0] = %(setup)r

exec(compile(open(%(setup)r).read(), %(setup)r, 'exec'))
"""

logger = logging.getLogger('zc.buildout')


def cython_patch(cython_path, develop):
    def hook(*a, **kw):
        runsetup = runsetup_template.replace('@CYTHON@', repr(cython_path))
        with easy_install._Monkey(easy_install, runsetup_template=runsetup):
            return develop(*a, **kw)
    return hook


class Extension(object):
    def __init__(self, buildout):
        self.buildout = buildout

    def __call__(self):
        self._pull_cython()
        self._patch_subprocess()
        self._patch_buildout()

    def _pull_cython(self):
        if FAKE_PART_ID in self.buildout._raw:
            logger.error("The buildout already has a '%s' section,"
                         " this shouldn't happen" % FAKE_PART_ID)
            sys.exit(1)
        self.buildout._raw[FAKE_PART_ID] = dict(
            recipe='zc.recipe.egg:script',
            eggs='Cython',
        )
        # insert the fake part
        parts = self.buildout['buildout']['parts'].split()
        parts.insert(0, FAKE_PART_ID)
        self.buildout['buildout']['parts'] = " ".join(parts)
        self.buildout._install(FAKE_PART_ID)

    def _patch_subprocess(self):
        options = self.buildout['buildout']
        bindir = options["bin-directory"]
        cython = os.path.join(bindir, "cython")
        assert(os.path.exists(cython))

        class Popen(subprocess.Popen):
            def __init__(self, *args, **kwargs):
                env = kwargs.pop('env', None) or dict(os.environ)
                env['CYTHON'] = cython
                path = env['PATH'].split(':')
                if bindir not in path:
                    path.insert(0, bindir)
                    env['PATH'] = ':'.join(path)
                kwargs['env'] = env
                super(subprocess.Popen, self).__init__(*args, **kwargs)
        subprocess.Popen = Popen

    def _patch_buildout(self):
        options = self.buildout['buildout']
        working_set = easy_install.working_set(['Cython'],
                                               [options['eggs-directory']])
        cython_req = pkg_resources.Requirement.parse('Cython')
        cython = working_set.find(cython_req).location

        easy_install.develop = cython_patch(cython, easy_install.develop)


def extension(buildout=None):
    return Extension(buildout)()
