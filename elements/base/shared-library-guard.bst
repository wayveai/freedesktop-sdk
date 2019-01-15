kind: meson

depends:
  - filename: bootstrap-import.bst
  - filename: base/buildsystem-meson.bst
    type: build

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{sysconfdir}"
      ln -s /app/etc/freedesktop-sdk.ld.so.blockedlist "%{install-root}%{sysconfdir}/freedesktop-sdk.ld.so.blockedlist"

    
sources:
  - kind: git_tag
    url: https://gitlab.com/freedesktop-sdk/shared-library-guard.git
    ref: v19.01.1-0-g6140fa6652e419f0be362e9b455068bd2a1e13d0
