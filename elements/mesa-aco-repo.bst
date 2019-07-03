kind: flatpak_repo

depends:
- filename: public-stacks/flatpak-publish-tools.bst
  type: build
- filename: flatpak-images/mesa-aco.bst
  type: build

config:
  arch: '%{flatpak_arch}'
  repo-mode: bare-user-only
  environment:
  - public-stacks/flatpak-publish-tools.bst
  (?):
  - target_arch == 'i686':
      copy-refs:
      - src: runtime/org.freedesktop.Platform.GL.mesa-aco/%{flatpak_arch}/%{branch}
        dest: runtime/org.freedesktop.Platform.GL32.mesa-aco/x86_64/%{branch}
