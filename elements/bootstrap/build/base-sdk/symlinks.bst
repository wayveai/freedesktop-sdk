kind: import
description: Create required symlinks for BaseSdk
sources:
- kind: local
  path: elements/bootstrap/build/base-sdk/symlinks

sandbox:
  build-arch: '%{bootstrap_build_arch}'
