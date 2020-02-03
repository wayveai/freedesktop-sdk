kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: git_tag
  url: github:benjaminp/six.git
  track: master
  ref: 1.14.0-0-g3a3db7510b33eb22c63ad94bc735a9032949249f
