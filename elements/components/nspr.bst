kind: autotools

depends:
- filename: bootstrap-import.bst

variables:
  arch-conf: ''
  (?):
  - target_arch in ["x86_64", "aarch64", "ppc64le"]:
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
  url: tar_https:archive.mozilla.org/pub/nspr/releases/v4.32/src/nspr-4.32.tar.gz
  ref: bb6bf4f534b9559cf123dcdc6f9cd8167de950314a90a88b2a329c16836e7f6c
  base-dir: '*/nspr'
