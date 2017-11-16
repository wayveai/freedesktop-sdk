kind: flatpak-image

config:
  directory: "%{prefix}"
  exclude:
    - debug

  metadata:
    Runtime:
      name: org.freedesktop.BaseSdk
      runtime: org.freedesktop.BasePlatform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.BaseSdk/%{gcc_arch}/%{branch}

    'Extension org.freedesktop.BaseSdk.Debug':
      directory: "%{lib}/debug"
      autodelete: true
      no-autodownload: true

depends:
  - filename: base-image.bst
    type: build
