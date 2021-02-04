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
  url: pypi:d5/71/48402bb0ad24fcec28e72e41f00f7d276fffa000bcef7e70bba3dd286593/hotdoc-0.13.1.tar.gz
  sha256sum: caec543e575835dcaab46c39cfbe4ac9c8f9bfbd1951fabbe8fd19fa6add5c2b
