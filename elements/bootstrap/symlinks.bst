kind: import
description: Create basic symlinks for bootstrap
sources:
- kind: local
  path: elements/bootstrap/symlinks
sandbox:
  build-arch: '%{bootstrap_build_arch}'
