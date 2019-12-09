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
  url: tar_https:archive.mozilla.org/pub/nspr/releases/v4.22/src/nspr-4.22.tar.gz
  ref: c9e4b6cc24856ec93202fe13704b38b38ba219f0f2aeac93090ce2b6c696d430
  base-dir: '*/nspr'
