kind: flatpak_repo
description: Generates a flatpak repository with all flatpak image elements

depends:
- filename: deploy-tools/flatpak.bst
  type: build
- filename: flatpak-images/sdk.bst
  type: build
- filename: flatpak-images/sdk-debug.bst
  type: build
- filename: flatpak-images/sdk-docs.bst
  type: build
- filename: flatpak-images/sdk-locale.bst
  type: build
- filename: flatpak-images/platform.bst
  type: build
- filename: flatpak-images/platform-locale.bst
  type: build
- filename: flatpak-images/platform-arch-libs.bst
  type: build
- filename: flatpak-images/platform-arch-libs-debug.bst
  type: build
- filename: flatpak-images/platform-vaapi.bst
  type: build
- filename: flatpak-images/platform-html5.bst
  type: build
- filename: flatpak-images/clinfo.bst
  type: build
- filename: flatpak-images/glxinfo.bst
  type: build
- filename: flatpak-images/glxinfo-debug.bst
  type: build
- filename: flatpak-images/rust.bst
  type: build

config:
  arch: '%{gcc_arch}'
  environment:
  - deploy-tools/flatpak.bst
  (?):
  - target_arch == 'i686':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/x86_64/%{branch}
      - src: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}.Debug/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}.Debug/x86_64/%{branch}
  - target_arch == 'arm':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/aarch64/%{branch}
      - src: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/aarch64/%{branch}
