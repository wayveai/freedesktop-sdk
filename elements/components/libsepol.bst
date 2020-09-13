kind: autotools

build-depends:
- components/flex.bst
- components/m4.bst

depends:
- bootstrap-import.bst
- components/pcre2.bst

variables:
  builddir: ''
  notparallel: true

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'

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
  track: master
  match:
  - libsepol-*
  exclude:
  - '*rc*'
  ref: libsepol-3.1-0-g7df27b78e9eecbe65a57cdfefb9e51f547231b20
