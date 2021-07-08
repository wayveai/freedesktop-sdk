kind: pip

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/python3-pip.bst
- components/python3-wheel.bst
- components/pkg-config.bst
- components/flex.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/glib.bst
- components/libxml2.bst
- components/json-glib.bst
- components/llvm.bst

runtime-depends:
- components/python3-appdirs.bst
- components/python3-dbus-deviation.bst
- components/python3-lxml.bst
- components/python3-pyyaml.bst
- components/python3-schema.bst
- components/python3-toposort.bst
- components/python3-wheezy-template.bst
- components/python3-xdg.bst
- components/python3-networkx.bst
- components/python3-cchardet.bst
- components/python3-pkgconfig.bst
- components/python3-decorator.bst

environment:
  HOTDOC_BUILD_C_EXTENSION: enabled

public:
  bst:
    integration-commands:
    - python3 -c "import pkg_resources; pkg_resources.require('hotdoc')"

sources:
- kind: pypi
  name: hotdoc
  url: pypi:9d/2b/323e786145ec52d09ad0b05e0281d44a30d0d392464b68a17def94659178/hotdoc-0.13.4.tar.gz
  sha256sum: 2d917b20f084717ca607d39b4bc498292f9d170ddf3c94f21062cda7a3d5ab91
