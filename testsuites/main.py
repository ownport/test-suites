from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

import sys
import pytest

PYTEST_PLUGINS='pytest_cov.plugin'.split()

def run():
    try:
        args = sys.argv[1:]
        pytest.main(args, plugins=PYTEST_PLUGINS)
    except IOError as err:
        sys.stderr.write("[ERROR] Input/Output error, %s" % err)
        sys.exit(1)
