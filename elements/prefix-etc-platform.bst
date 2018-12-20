kind: script

depends:
- filename: desktop-platform-image.bst
  type: build

config:
  commands:
  - |
    mkdir -p %{install-root}/usr

  - |
    cp -ar /etc %{install-root}/usr/etc
