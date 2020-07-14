kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/pcre2.bst
- filename: components/libsepol.bst

variables:
  builddir: ''

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'
  SBINDIR: '%{sbindir}'

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
  ref: libselinux-3.1-0-g7df27b78e9eecbe65a57cdfefb9e51f547231b20
