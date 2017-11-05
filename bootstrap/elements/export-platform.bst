kind: manual

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: bootstrap-platform-with-links.bst
  type: build

config:
  install-commands:
    - |
      cd "%{sysroot}" && tar zcf "%{install-root}/bootstrap-image-platform-%{target_arch}.tar.gz" .
