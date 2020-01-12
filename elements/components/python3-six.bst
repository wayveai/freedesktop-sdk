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
  ref: 1.13.0-0-gec58185ed09153ec940ed3da52a58343780fee2a
