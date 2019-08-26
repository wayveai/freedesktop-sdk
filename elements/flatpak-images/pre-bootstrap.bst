kind: flatpak_image

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - docs
  - locale
  - static-blocklist

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.PreBootstrap
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

depends:
- filename: pre-bootstrap.bst
  type: build
