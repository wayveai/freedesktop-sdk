kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  install-commands:
    - |
      mkdir -p "%{install-root}%{datadir}/runtime/docs"

public:
  bst:
    integration-commands:
      - |
        mv %{datadir}/man %{datadir}/runtime/docs/
        ln -s %{datadir}/runtime/docs/man %{datadir}/man

      - |
        targetdir="%{datadir}/runtime/locale"
        mkdir -p "${targetdir}"
        movelocale() {
          subdir="$1"
          origpath="$2"
          for langpath in "${origpath}"/*; do
            if [ -d "${langpath}" ]; then
              lang=$(basename "${langpath}" | sed 's/[@\._].*//g')
              case "${lang}" in
                C|en)
                  ;;
                *)
                    mkdir -p "${targetdir}/${lang}/${subdir}"
                    mv "${langpath}" "${targetdir}/${lang}/${subdir}/"
                    ln -s "$(realpath --relative-to="${origpath}" "${targetdir}/${lang}/${subdir}/$(basename "${langpath}")")" "${langpath}"
                  ;;
              esac
            fi
          done
        }
        movelocale "share" "%{datadir}/locale"
        movelocale "lib" "%{indep-libdir}/locale"
