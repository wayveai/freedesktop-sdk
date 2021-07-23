kind: manual

depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    install -m 0755 -d "%{install-root}/usr/share/fonts/openemoji"
    install -p -m 644 OpenMoji-Color.ttf "%{install-root}/usr/share/fonts/openemoji"

sources:
- kind: remote
  url: github_files:hfg-gmuend/openmoji/raw/47b44b717c282b37856334ebf0e0f7439bbd4020/font/OpenMoji-Color.ttf
  ref: dec63793f14355f4d5d2d8163e0f5e5c4073ed623307073b3774831ceec9cfa6
