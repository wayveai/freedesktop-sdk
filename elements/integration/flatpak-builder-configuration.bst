kind: manual
description: Adds a default file to be passed to flatpak-builder

depends:
- filename: bootstrap-import.bst
  type: build

config:
  build-commands:
  - |
    cat >defaults.json <<EOF
    {
      'libdir': '%{libdir}',
      'cflags': '${CFLAGS}',
      'cxxflags': '${CXXFLAGS}',
      'cppflags': '${CPPFLAGS}',
      'ldflags': '-L/app/lib ${LDFLAGS}'
    }
    EOF


  install-commands:
  - |
    install -Dm 0644 -t "%{install-root}%{sysconfdir}/flatpak-builder" defaults.json
