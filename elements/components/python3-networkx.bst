kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: networkx
  include:
  - '2\.8(\.|$)'
  exclude:
  - '.*rc.*'
  ref:
    sha256sum: 67fab04a955a73eb660fe7bf281b6fa71a003bc6e23a92d2f6227654c5223dbe
    suffix: 78/6c/85c0664365d32a32806bd12d46ea5dc466aa3aa7e8086e5daf3505b8cf33/networkx-2.8.3.tar.gz
