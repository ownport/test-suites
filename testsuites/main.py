
import __init__

import sys
import pytest


def run():

    try:
        args = sys.argv[1:]
        pytest.main(args)
    except IOError, err:
        print >> sys.stderr, "[ERROR] Input/Output error, %s" % err
        sys.exit(1)

