kind: filter

build-depends:
- components/apparmor-base.bst

runtime-depends:
- components/apparmor-manifest.bst
- bootstrap-import.bst

config:
  include:
  - libapparmor

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libapparmor.so'
