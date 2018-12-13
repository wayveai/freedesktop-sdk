kind: script

depends:
- filename: desktop-image.bst
  type: build

config:
  commands:
  - |
    mkdir -p %{install-root}/usr

  - |
    cp -ar /etc %{install-root}/usr/etc

  - |
    cp -ar /var %{install-root}/usr/var
