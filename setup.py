from setuptools import setup
from testsuites import __version__

setup(
    name='test-suites',
    version=__version__,
    py_modules=['testsuites'],
    entry_points='''
        [console_scripts]
        test-suites=testsuites.main:run
    ''',
)