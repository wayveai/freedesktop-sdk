kind: script

build-depends:
- oci/oci-builder.bst
- oci/layers/bootstrap.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/bootstrap.bst
    destination: /layer

  commands:
  - |
    cd "%{install-root}"
    build-oci <<EOF
    mode: oci
    gzip: false
    images:
    - os: linux
      architecture: '%{go-arch}'
      layer: /layer
      comment: 'Import bootstrap layer from Freedesktop SDK'
    EOF
