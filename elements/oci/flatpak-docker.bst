kind: script

build-depends:
- oci/oci-builder.bst
- oci/sdk-oci.bst
- oci/layers/flatpak.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/flatpak.bst
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
      comment: "Import flatpak"
      tags:
      - freedesktopsdk/flatpak:latest
    EOF
