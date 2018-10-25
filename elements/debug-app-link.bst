kind: manual
description: Creates a debug directory, links the debug data of /app to a subdirectory
  of it

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{debugdir}"
    ln -s /app/lib/debug "%{install-root}%{debugdir}/app"
