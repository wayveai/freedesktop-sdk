kind: script

build-depends:
- bootstrap/build/base-sdk.bst


(@):
- elements/bootstrap/include/target.yml

config:
  commands:
  - mkdir -p %{install-root}%{libdir}/pkgconfig
