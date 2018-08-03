kind: manual

depends:
  - filename: bootstrap-import.bst

config:
  install-commands:
    - |
      mkdir -p "%{install-root}%{debugdir}"
      ln -s /app/lib/debug "%{install-root}%{debugdir}/app"
