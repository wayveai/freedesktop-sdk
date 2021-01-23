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
  url: pypi:dc/2a/a24892ea609b1157c8c9a856dfe67d237adb8de49a5fffa84eb0267d8c30/hotdoc-0.12.2.tar.gz
  sha256sum: 2774baba150923a1b201ed72c5cb06507e90daf8f5b832f475182c7231dbd75b
- kind: patch
  path: patches/hotdoc/networkx-2.5.patch
