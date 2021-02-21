kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-pip.bst
  type: build

sources:
- kind: pypi
  name: pygments
  url: pypi:19/d0/dec5604a275b19b0ebd2b9c43730ce39549c8cd8602043eaf40c541a7256/Pygments-2.8.0.tar.gz
  sha256sum: 37a13ba168a02ac54cc5891a42b1caec333e59b66addb7fa633ea8a6d73445c0
