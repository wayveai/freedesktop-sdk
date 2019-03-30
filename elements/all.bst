kind: flatpak_repo
description: Generates a flatpak repository with all flatpak image elements

depends:
- filename: deploy-tools/flatpak.bst
  type: build
- filename: flatpak-images/platform-vaapi.bst
  type: build
- filename: flatpak-images/platform-html5.bst
  type: build

config:
  arch: '%{gcc_arch}'
  environment:
  - deploy-tools/flatpak.bst
