kind: script

build-depends:
- oci/oci-builder.bst
- oci/sdk-oci.bst
- oci/layers/debug.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/debug.bst
    destination: /layer
  - element: oci/sdk-oci.bst
    destination: /parent

  commands:
  - |
    cd "%{install-root}"
    build-oci <<EOF
    mode: docker
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Import debug layer from Freedesktop SDK"
      tags:
      - freedesktopsdk/debug:latest
    EOF
