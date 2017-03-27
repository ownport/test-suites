from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

import os
import sys
import pytest


def run():
    try:
        args = sys.argv[1:]
        pytest.main(args)
    except IOError as err:
        print >> sys.stderr, "[ERROR] Input/Output error, %s" % err
        sys.exit(1)
