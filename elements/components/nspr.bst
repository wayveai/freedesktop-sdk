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
  url: tar_https:archive.mozilla.org/pub/nspr/releases/v4.24/src/nspr-4.24.tar.gz
  ref: 90a59a0df6a11528749647fe18401cc7e03881e3e63c309f8c520ce06dd413d0
  base-dir: '*/nspr'
