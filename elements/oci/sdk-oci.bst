kind: script

build-depends:
- oci/oci-builder.bst
- oci/platform-oci.bst
- oci/layers/sdk.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/sdk.bst
    destination: /layer
  - element: oci/platform-oci.bst
    destination: /parent

  commands:
  - |
    cd "%{install-root}"
    build-oci <<EOF
    mode: oci
    gzip: False
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Import sdk layer from Freedesktop SDK"
    EOF
