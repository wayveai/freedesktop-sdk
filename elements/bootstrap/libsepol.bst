kind: make

build-depends:
- bootstrap/libsepol-build-deps.bst

runtime-depends:
- bootstrap/pcre2.bst

(@):
- elements/bootstrap/include/target.yml

variables:
  notparallel: true
  command-subdir: libsepol

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'
  CC: '%{triplet}-gcc'
  PKG_CONFIG_PATH: '%{sysroot}%{libdir}/pkgconfig'

config:
  install-commands:
    (>):
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
  track: master
  match:
  - libsepol-*
  exclude:
  - '*rc*'
  ref: libsepol-3.3-0-g7f600c40bc18d8180993edcd54daf45124736776
