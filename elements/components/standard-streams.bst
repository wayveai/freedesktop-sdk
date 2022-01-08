kind: manual
description: >-
  This provides standard streams to components that need them during build

depends:
- bootstrap-import.bst

config:
  install-commands:
  - mkdir -p %{install-root}/dev
  - ln -s /proc/self/fd/0 %{install-root}/dev/stdin
  - ln -s /proc/self/fd/1 %{install-root}/dev/stdout
  - ln -s /proc/self/fd/2 %{install-root}/dev/stderr
