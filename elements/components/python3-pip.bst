kind: distutils

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: pypi
  name: pip
  exclude:
  - '^.*(?:[ab]|rc)[0-9]*$'
  url: pypi:59/64/4718738ffbc22d98b5223dbd6c5bb87c476d83a4c71719402935170064c7/pip-20.2.3.tar.gz
  sha256sum: 30c70b6179711a7c4cf76da89e8a0f5282279dfb0278bec7b94134be92543b6d
