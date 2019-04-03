kind: flatpak_image

depends:
- filename: extensions/rust-sdk-image.bst
  type: build

variables:
  prefix: /usr/lib/sdk/rust
  lib: lib
  debugdir: /usr/lib/debug

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - docs
  - locale

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.Extension.rust-stable
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Sdk/%{gcc_arch}/%{branch}
