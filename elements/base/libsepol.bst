kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/flex.bst
  type: build
- filename: base/m4.bst
  type: build

variables:
  builddir: ''

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'

config:
  configure-commands: []

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
- kind: tar
  url: github_files:SELinuxProject/selinux/releases/download/20180524/libsepol-2.8.tar.gz
  ref: 3ad6916a8352bef0bad49acc8037a5f5b48c56f94e4cb4e1959ca475fa9d24d6
