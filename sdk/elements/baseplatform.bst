kind: flatpak-image

config:
  directory: "%{prefix}"
  exclude:
    - debug

  metadata:
    Runtime:
      name: org.freedesktop.BasePlatform
      runtime: org.freedesktop.BasePlatform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.BaseSdk/%{gcc_arch}/%{branch}

depends:
  - filename: base-platform-image.bst
    type: build
