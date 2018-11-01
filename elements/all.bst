kind: stack
description: Collection of all flatpak image elements to be built

depends:
- filename: flatpak-images/sdk.bst
- filename: flatpak-images/sdk-debug.bst
- filename: flatpak-images/sdk-docs.bst
- filename: flatpak-images/sdk-locale.bst
- filename: flatpak-images/platform.bst
- filename: flatpak-images/platform-locale.bst
- filename: flatpak-images/platform-arch-libs.bst
- filename: flatpak-images/platform-arch-libs-debug.bst
- filename: flatpak-images/platform-vaapi.bst
- filename: flatpak-images/platform-html5.bst
- filename: flatpak-images/clinfo.bst
- filename: flatpak-images/glxinfo.bst
- filename: flatpak-images/glxinfo-debug.bst
- filename: flatpak-images/rust.bst
