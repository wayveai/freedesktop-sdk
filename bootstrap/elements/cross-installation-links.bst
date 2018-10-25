kind: import
description: Create required symlinks for cross-installation
sources:
- kind: local
  path: elements/cross-installation-links

config:
  target: '%{sysroot}'
