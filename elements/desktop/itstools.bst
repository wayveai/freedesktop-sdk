kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
- filename: base/libxslt.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: PYTHON="/usr/bin/python3"

sources:
- kind: git_tag
  url: github:itstool/itstool.git
  track: master
  ref: 2.0.5-0-g39000db89b4d376af34fd4499743ac0fa5d7cd90
