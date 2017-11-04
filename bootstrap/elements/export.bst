kind: manual

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: bootstrap-with-links.bst
  type: build

config:
  install-commands:
    - |
      cd "%{sysroot}" && tar zcf "%{install-root}/bootstrap-image-%{target_arch}.tar.gz" .
