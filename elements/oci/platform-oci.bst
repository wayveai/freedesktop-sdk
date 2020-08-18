kind: script

build-depends:
- oci/oci-builder.bst
- oci/bootstrap-oci.bst
- oci/layers/platform.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/platform.bst
    destination: /layer
  - element: oci/bootstrap-oci.bst
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
      comment: "Import platform layer from Freedesktop SDK"
    EOF
