kind: autotools

build-depends:
- bootstrap/libsepol-build-deps.bst

runtime-depends:
- bootstrap/pcre2.bst

(@):
- elements/bootstrap/include/target.yml

variables:
  builddir: ''
  notparallel: true

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'
  CC: '%{triplet}-gcc'
  PKG_CONFIG_PATH: '%{sysroot}%{libdir}/pkgconfig'

config:
  configure-commands: []
  build-commands:
  - |
    cd libsepol && %{make}

  install-commands:
  - |
    cd libsepol && %{make-install}

  - |
    rm "%{install-root}/%{libdir}/libsepol.a"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsepol.so'

sources:
- kind: git_tag
  url: github:SELinuxProject/selinux.git
  #track: master
  #match:
  #- libsepol-*
  #exclude:
  #- '*rc*'
  ref: libsepol-3.2-0-gcf853c1a0c2328ad6c62fb2b2cc55d4926301d6b
