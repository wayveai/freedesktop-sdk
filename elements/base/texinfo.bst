kind: autotools
description: GNU texinfo

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst

variables:
  conf-local: |
    PERL_EXT_CFLAGS="$CFLAGS" \
    PERL_EXT_LDFLAGS="$LDFLAGS"

public:
  bst:
    integration-commands:
    - |
      rm -f "%{infodir}/dir"
      for f in "%{infodir}"/*; do
        case "$(basename "${f}")" in
          *.png|*.jpg|*-[0-9])
            ;;
          *)
            install-info --info-dir="%{infodir}" "${f}"
            ;;
        esac
      done

sources:
- kind: tar
  url: ftp_gnu_org:texinfo/texinfo-6.5.tar.xz
  ref: 77774b3f4a06c20705cc2ef1c804864422e3cf95235e965b1f00a46df7da5f62
