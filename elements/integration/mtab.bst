kind: manual
description: Adds a link from /etc/mtab -> /proc/self/mounts

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}/proc/self"
    mkdir -p "%{install-root}/etc"
    ln -s ../../proc/self/mounts %{install-root}/etc/mtab
