kind: flatpak_repo
description: Generates a flatpak repository with all flatpak image elements

depends:
- filename: deploy-tools/flatpak.bst
  type: build
- filename: flatpak-release-deps.bst
  type: build
- filename: flatpak-images/mesa.bst
  type: build
- filename: flatpak-images/cross-toolchains.bst
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
      - src: runtime/org.freedesktop.Platform.GL.default/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.default/x86_64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}/x86_64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}.Debug/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}.Debug/x86_64/%{branch}
  - target_arch == 'arm':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/aarch64/%{branch}
      - src: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.Compat.%{gcc_arch}/aarch64/%{branch}
      - src: runtime/org.freedesktop.Platform.GL.default/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.default/aarch64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}/x86_64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}.Debug/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}.Debug/x86_64/%{branch}

  - target_arch == 'aarch64':
      copy-refs:
      - src: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}/x86_64/%{branch}
      - src: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}.Debug/%{gcc_arch}/%{branch}
        dest: runtime/org.freedesktop.Sdk.Compat.%{gcc_arch}.Debug/x86_64/%{branch}
