kind: manual
description: Adds a default file to be passed to flatpak-builder

build-depends:
- bootstrap-import.bst
- components/jq.bst

config:
  build-commands:
  - |
    jq -n \
    --arg libdir '%{libdir}' \
    '{
      "libdir": $libdir,
      "cflags": ($ENV.CFLAGS // ""),
      "cxxflags": ($ENV.CXXFLAGS // ""),
      "cppflags": ($ENV.CPPFLAGS // ""),
      "ldflags": "-L/app/lib \($ENV.LDFLAGS // "")"
    }' > defaults.json


  install-commands:
  - |
    install -Dm 0644 -t "%{install-root}%{sysconfdir}/flatpak-builder" defaults.json
