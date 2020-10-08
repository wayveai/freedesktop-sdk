kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- components/cairo.bst
- components/python3.bst

sources:
- kind: pypi
  name: pycairo
  url: pypi:9d/6e/499d6a6db416eb3cdf0e57762a269908e4ab6638a75a90972afc34885b91/pycairo-1.20.0.tar.gz
  sha256sum: 5695a10cb7f9ae0d01f665b56602a845b0a8cb17e2123bfece10c2e58552468c
