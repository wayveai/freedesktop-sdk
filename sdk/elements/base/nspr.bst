kind: autotools

depends:
  - filename: bootstrap-import.bst

variables:
  arch-conf: ''
  (?):
    - target_arch == "x86_64" or target_arch == "aarch64":
        arch-conf: |
          --enable-64bit
  conf-local: '%{arch-conf}'
  make: make SH_DATE="$(date --date="@${SOURCE_DATE_EPOCH}" "+%Y-%m-%d %T")" SH_NOW="${SOURCE_DATE_EPOCH}"

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
    url: https://archive.mozilla.org/pub/nspr/releases/v4.19/src/nspr-4.19.tar.gz
    ref: 2ed95917fa2277910d1d1cf36030607dccc0ba522bba08e2af13c113dcd8f729
    base-dir: "*/nspr"
