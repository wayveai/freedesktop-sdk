kind: autotools

depends:
  - filename: bootstrap-import.bst
    type: build

variables:
  arch-conf: ''
  (?):
    - target_arch == "x86_64" or target_arch == "aarch64":
        arch-conf: |
          --enable-64bit
  conf-local: '%{arch-conf}'

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/nspr-config"

config:
  install-commands:
    (>):
      - |
        rm -f "%{install-root}%{libdir}"/lib*.a

      - |
        rm -f "%{install-root}%{bindir}/prerr.properties" "%{install-root}%{bindir}/compile-et.pl"

sources:
  - kind: tar
    url: https://archive.mozilla.org/pub/nspr/releases/v4.17/src/nspr-4.17.tar.gz
    ref: 590a0aea29412ae22d7728038c21ef2ab42646e48172a47d2e4bb782846d1095
    base-dir: "*/nspr"
