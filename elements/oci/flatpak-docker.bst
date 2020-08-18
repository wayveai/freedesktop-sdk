kind: oci

build-depends:
- oci/sdk-oci.bst
- oci/layers/flatpak.bst

# For build time optimization
- oci/layers/sdk.bst

config:
  mode: docker
  images:
  - os: linux
    architecture: "%{go-arch}"
    parent:
      element: oci/sdk-oci.bst
    layer:
    - oci/layers/flatpak.bst
    comment: "Import flatpak"
    tags:
    - freedesktopsdk/flatpak:latest
