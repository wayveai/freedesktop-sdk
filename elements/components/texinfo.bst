kind: autotools
description: GNU texinfo

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst

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
  url: ftp_gnu_org:texinfo/texinfo-6.7.tar.xz
  ref: 988403c1542d15ad044600b909997ba3079b10e03224c61188117f3676b02caa
