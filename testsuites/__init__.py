__title__ = 'test-suites'
__version__="0.1.2"

import os
import sys

path = os.path.realpath(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(os.path.dirname(path), 'packages/'))
