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
  ref: libsepol-3.0-0-gdca7ce8195d241bf44eb4b158ef2e5d6e3b9963a
