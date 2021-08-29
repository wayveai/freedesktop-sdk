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
  url: pypi:c0/71/726cfc8f179b7b8d1401eb77132e34d8785b0cde3f2625ab75447639bf7a/hotdoc-0.13.5.tar.gz
  sha256sum: b9b59f8a38932cb07018fd8a411016c962bb49bdddab0358926f9eca359925c9
