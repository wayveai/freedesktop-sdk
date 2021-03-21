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
  url: pypi:f4/72/36f0a8ff6ba7f0e3c30b885100bea50401a074c9540f5383327c96eb2134/hotdoc-0.13.3.tar.gz
  sha256sum: 226042da44a7a710316112fba1083c3165fe26bdfd701835569934c077a95cb1
