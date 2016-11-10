
test_yaml_file='''
key1: value1
key2: value2
'''

def test_yaml_pkg_import():

    from testsuites.packages import yaml
    assert yaml.load(test_yaml_file) == {'key1': 'value1', 'key2': 'value2'}
