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
  url: ftp_gnu_org:texinfo/texinfo-6.6.tar.xz
  ref: 9bb9ca00da53f26a7e5725eee49689cd4a1e18d25d5b061ac8b2053018d93d66
