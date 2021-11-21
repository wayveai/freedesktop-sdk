kind: manual
description: Creates VAAPI subdirectories, needed for VAAPI compat extensions

build-depends:
- bootstrap-import.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{libdir}/dri/intel-vaapi-driver"
