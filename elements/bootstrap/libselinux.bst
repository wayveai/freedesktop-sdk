kind: autotools

build-depends:
- bootstrap/libselinux-build-deps.bst

runtime-depends:
- bootstrap/pcre2.bst
- bootstrap/libsepol.bst

(@):
- elements/bootstrap/include/target.yml

variables:
  build-dir: ''

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'
  SBINDIR: '%{sbindir}'
  CC: '%{triplet}-gcc'
  PKG_CONFIG_PATH: '%{sysroot}%{libdir}/pkgconfig'

config:
  configure-commands: []
  build-commands:
  - |
    cd libselinux && %{make}

  install-commands:
  - |
    cd libselinux && %{make-install}

  - |
    rm "%{install-root}/%{libdir}/libselinux.a"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libselinux.so'

sources:
- kind: git_tag
  url: github:SELinuxProject/selinux.git
  track: master
  match:
  - libselinux-*
  exclude:
  - '*rc*'
  ref: libselinux-3.3-0-g7f600c40bc18d8180993edcd54daf45124736776
