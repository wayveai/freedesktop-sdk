kind: manual

depends:
  - filename: base.bst
    type: build
  - filename: desktop/appstream-glib.bst
    type: build

config:
  build-commands:
    - |
      for i in *.in; do
        sed "s/@@SDK_BRANCH@@/%{branch}/g" "${i}" >"$(basename "${i}" .in)"
      done

  install-commands:
    - |
      mkdir -p "%{install-root}%{indep-libdir}"
      install os-release "%{install-root}%{indep-libdir}"
      mkdir -p "%{install-root}%{sysconfdir}"
      ln -s "$(realpath --relative-to="%{install-root}%{sysconfdir}" "%{install-root}%{indep-libdir}/os-release")" %{install-root}%{sysconfdir}/os-release
      install issue "%{install-root}%{sysconfdir}"
      install issue.net "%{install-root}%{sysconfdir}"
      mkdir -p "%{install-root}%{datadir}/appdata"
      install org.freedesktop.Platform.appdata.xml "%{install-root}%{datadir}/appdata"
      install org.freedesktop.Sdk.appdata.xml "%{install-root}%{datadir}/appdata"
      appstream-compose --basename=org.freedesktop.Platform --prefix=%{install-root}%{prefix} --origin=flatpak org.freedesktop.Platform
      appstream-compose --basename=org.freedesktop.Sdk --prefix=%{install-root}%{prefix} --origin=flatpak org.freedesktop.Sdk

    - |
      mkdir -p "%{install-root}%{datadir}/runtime/share/themes"
      mkdir -p "%{install-root}%{datadir}/runtime/share/icons"
      mkdir -p "%{install-root}%{datadir}/runtime/docs"
      mkdir -p "%{install-root}%{datadir}/runtime/docs/gtk-doc"

    - |
      mkdir -p "%{install-root}%{libdir}/GL"

public:
  bst:
    integration-commands:
      - |
        mv %{datadir}/man %{datadir}/runtime/docs/
        ln -s %{datadir}/runtime/docs/man %{datadir}/man
        mv %{datadir}/gtk-doc/html %{datadir}/runtime/docs/gtk-doc/
        ln -s %{datadir}/runtime/docs/gtk-doc/html %{datadir}/gtk-doc/html

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

sources:
  - kind: local
    path: elements/desktop/os-release

