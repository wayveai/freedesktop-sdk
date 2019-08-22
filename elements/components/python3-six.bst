kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst

sources:
- kind: git_tag
  url: github:benjaminp/six.git
  track: master
  ref: 1.12.0-0-gd927b9e27617abca8dbf4d66cc9265ebbde261d6
