kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build
- filename: components/python3-wheel.bst
  type: build

sources:
- kind: pypi
  name: markdown
  ref:
    sha256sum: 76df8ae32294ec39dcf89340382882dfa12975f87f45c3ed1ecdb1e8cefc7006
    suffix: 15/06/d60f21eda994b044cbd496892d4d4c5c708aa597fcaded7d421513cb219b/Markdown-3.3.6.tar.gz
