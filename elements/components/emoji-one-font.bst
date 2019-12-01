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
- kind: remote
  url: github_files:emojione/emojione/raw/693a9705f60efd566e40a5c9ec00ca306c9bcbd0/extras/fonts/emojione-android.ttf
  ref: 6b43a1425844274c6fab96a6e3dad3a903d6f541c43bcbb665a8e09c775aa66d
