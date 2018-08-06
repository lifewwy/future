Overview
========



This `Pytest`_ plugin allows for the doctesting of C extension modules
for Python, specifically created through `Cython`_.


Installation
============

You can install "pytest-cython" via `pip`_ from `PyPI`_::

    pip install pytest-cython


Usage
=====

Basic usage::

    py.test --doctest-cython

Note
----

* It is assumed that the C extension modules have been build inplace before
  running `py.test` and there is a matching Cython `.pyx` file
* The `embedsignature` `Cython compiler directive`_ must be set to `True`


Contributing
============
Contributions are very welcome. Tests can be run with `tox`_::

    tox


License
=======

* Free software: MIT license

Distributed under the terms of the `MIT`_ license, "pytest-cython" is free and
open source software


Issues
======

If you encounter any problems, please `file an issue`_ along with a detailed
description.


Acknowledgements
================

This `Pytest`_ plugin was generated with `Cookiecutter`_ along with
`@hackebrot`_'s `Cookiecutter-pytest-plugin`_ and `@ionelmc`_'s
`cookiecutter-pylibrary`_ templates.


.. _`Cookiecutter`: https://github.com/audreyr/cookiecutter
.. _`@hackebrot`: https://github.com/hackebrot
.. _`@ionelmc`: https://github.com/ionelmc
.. _`MIT`: http://opensource.org/licenses/MIT
.. _`BSD-3`: http://opensource.org/licenses/BSD-3-Clause
.. _`GNU GPL v3.0`: http://www.gnu.org/licenses/gpl-3.0.txt
.. _`Apache Software License 2.0`: http://www.apache.org/licenses/LICENSE-2.0
.. _`cookiecutter-pytest-plugin`: https://github.com/pytest-dev/cookiecutter-pytest-plugin
.. _`cookiecutter-pylibrary`: https://github.com/ionelmc/cookiecutter-pylibrary
.. _`file an issue`: https://github.com/lgpage/pytest-cython/issues
.. _`pytest`: https://github.com/pytest-dev/pytest
.. _`tox`: https://tox.readthedocs.org/en/latest/
.. _`pip`: https://pypi.python.org/pypi/pip/
.. _`PyPI`: https://pypi.python.org/pypi
.. _`Cython`: http://cython.org/
.. _`Cython compiler directive`: http://docs.cython.org/src/reference/compilation.html#compiler-directives


Changelog
=========

0.1.0 (2016-04-17)
-----------------------------------------

* First release on PyPI.


