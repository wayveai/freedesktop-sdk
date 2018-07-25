kind: manual

depends:
  - bootstrap-import.bst

config:
  install-commands:
    - |
      install -m 0755 -d "%{install-root}/usr/share/fonts/eosrei-emojione"
      install -p -m 644 emojione-android.ttf "%{install-root}/usr/share/fonts/eosrei-emojione"

sources:
  # Last free version, do not update!
  - kind: local
    path: files/fonts/emojione-android.ttf
