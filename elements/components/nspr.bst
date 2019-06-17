kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  arch-conf: ''
  (?):
  - target_arch in ["x86_64", "aarch64", "powerpc64le"]:
      arch-conf: |
        --enable-64bit
  conf-local: '%{arch-conf}'
  make: make SH_DATE="$(date --date="@${SOURCE_DATE_EPOCH}" "+%Y-%m-%d %T")" SH_NOW="${SOURCE_DATE_EPOCH}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/nspr-config'
  cpe:
    product: netscape_portable_runtime

config:
  install-commands:
    (>):
    - |
      rm -f "%{install-root}%{libdir}"/lib*.a

    - |
      rm -f "%{install-root}%{bindir}/prerr.properties" "%{install-root}%{bindir}/compile-et.pl"

sources:
- kind: tar
  url: https://archive.mozilla.org/pub/nspr/releases/v4.21/src/nspr-4.21.tar.gz
  ref: 15ea32c7b100217b6e3193bc03e77f485d9bf7504051443ba9ce86d1c17c6b5a
  base-dir: '*/nspr'
