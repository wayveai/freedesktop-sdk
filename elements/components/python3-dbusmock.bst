kind: pip

depends:
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

- filename: components/python3-dbus.bst
  type: runtime

sources:
- kind: pypi
  name: python-dbusmock
  url: pypi:c1/ac/07192e57c80909667fb4a01eb8d9edc12d6ed726b39ae1fad9a8e226c4b1/python-dbusmock-0.27.4.tar.gz
  sha256sum: 116b03a66edd00696087462e890288e4edef9bb57814fcfe2831a5594e68c25d
