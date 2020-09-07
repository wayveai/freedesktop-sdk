kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-markupsafe.bst

sources:
- kind: tar
  url: pypi:36/cc/5cd404a00f1b93bc830505c7a78553d9f49f7152c336466fc206790cc26c/Jinja2-3.0.0a1.tar.gz
  ref: c922560ac46888d47384de1dbdc3daaa2ea993af4b26a436dec31fa2c19ec668
