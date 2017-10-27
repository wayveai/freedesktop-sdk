kind: manual

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: bootstrap.bst
  type: build

config:
  install-commands:
    - |
      cd "%{sysroot}" && tar Jcf "%{install-root}/bootstrap-image-%{target_arch}.tar.xz" .
