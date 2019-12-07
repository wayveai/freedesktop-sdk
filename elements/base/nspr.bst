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
  url: tar_https:archive.mozilla.org/pub/nspr/releases/v4.20/src/nspr-4.20.tar.gz
  ref: 2c8964913da89ffbaf464d49ce44d79e8804e1794ef9a8c52a7bff7224d1556e
  base-dir: '*/nspr'
