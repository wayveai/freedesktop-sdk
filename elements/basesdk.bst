kind: flatpak_image

config:
  directory: "%{prefix}"
  exclude:
    - debug
    - docs
    - locale

  metadata:
    Runtime:
      name: org.freedesktop.BaseSdk
      runtime: org.freedesktop.BasePlatform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.BaseSdk/%{gcc_arch}/%{branch}

    'Extension org.freedesktop.BaseSdk.Debug':
      directory: "lib/debug"
      autodelete: "true"
      no-autodownload: "true"

    'Extension org.freedesktop.BaseSdk.Docs':
      directory: "share/runtime/docs"
      autodelete: "true"
      no-autodownload: "true"

    'Extension org.freedesktop.BasePlatform.Locale':
      directory: "share/runtime/locale"
      autodelete: "true"
      locale-subset: "true"

depends:
  - filename: base-image.bst
    type: build
  - filename: basesdk-integration.bst
    type: build
