kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/flex.bst
  type: build
- filename: components/m4.bst
  type: build
- filename: components/pcre2.bst

variables:
  builddir: ''
  notparallel: true
  local_flags: -fcommon

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
  # Tracking limited to 3.1 since 3.2 broke ABI
  match:
  - libsepol-3.1
  - libsepol-3.1.*
  exclude:
  - '*rc*'
  ref: libsepol-3.1-0-g7df27b78e9eecbe65a57cdfefb9e51f547231b20
