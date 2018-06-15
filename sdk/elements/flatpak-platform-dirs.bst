kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  install-commands:
    - |
      mkdir -p "%{install-root}%{libdir}/dri/intel-vaapi-driver"
