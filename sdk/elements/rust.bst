kind: flatpak-image

depends:
  - filename: rust-sdk-image.bst
    type: build

variables:
  prefix: "/usr/lib/sdk/rust"
  lib: "lib"
  debugdir: "/usr/lib/debug"

config:
  directory: "%{prefix}"
  exclude:
    - debug
    - docs
    - locale

  metadata:
    Runtime:
      name: org.freedesktop.BaseSdk.Extension.rust-stable
      runtime: org.freedesktop.BasePlatform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.BaseSdk/%{gcc_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.BaseSdk/%{gcc_arch}/%{branch}
