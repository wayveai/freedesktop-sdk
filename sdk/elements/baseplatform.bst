kind: flatpak_image

config:
  directory: "%{prefix}"
  exclude:
    - debug

  metadata:
    Runtime:
      name: org.freedesktop.BasePlatform
      runtime: org.freedesktop.BasePlatform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.BaseSdk/%{gcc_arch}/%{branch}

    'Extension org.freedesktop.BaseSdk.Locale':
      directory: "share/runtime/locale"
      autodelete: "true"
      locale-subset: "true"

depends:
  - filename: base-platform-image.bst
    type: build
  - filename: baseplatform-integration.bst
    type: build
