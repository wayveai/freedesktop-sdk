kind: manual

(@):
- flatpak-version.yml

depends:
- filename: bootstrap-import.bst
- filename: components/m4.bst
  type: build
- filename: components/appstream-glib.bst
  type: build

config:
  build-commands:
  - |
    for i in *.in; do
      m4 -D__RUNTIME_VERSION__=%{runtime-version} -D__RUNTIME_VERSION_DATE__=%{runtime-version-date} "${i}" >"$(basename "${i}" .in)"
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

sources:
- kind: local
  path: files/os-release

