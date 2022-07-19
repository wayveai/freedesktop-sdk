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
    sha256sum: 15a7b81a360791c458c55a417418ea136c13378cfdc06a2dcdc12bd2f9cf09c1
    suffix: f2/af/fe794d69bcc4882c4905b49c8b207b8dc4dd7ea26e6142781eac8203ea05/networkx-2.8.5.tar.gz
