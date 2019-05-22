kind: flatpak_image

config:
  directory: '%{prefix}'
  exclude:
  - debug
  - docs
  - locale

  metadata:
    Runtime:
      name: org.freedesktop.Sdk.PreBootstrap
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

depends:
- filename: pre-bootstrap.bst
  type: build
