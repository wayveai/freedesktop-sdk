kind: pip

build-depends:
- components/python3-pip.bst
- components/python3-poetry-core.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: tomlkit
  ref:
    sha256sum: 0ace4c975e0f3e6f71be8a2d61fe568777f1634bc80abff642cd3323ce709a0d
    suffix: f6/33/e5e55afcc6e062ba706a0492460f5702955d077adbcaf561d04799b412d5/tomlkit-0.11.3.tar.gz
