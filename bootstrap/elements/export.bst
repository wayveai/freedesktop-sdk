kind: manual

depends:
- filename: bootstrap.bst
  type: build

config:
  install-commands:
    - |
      cd "%{sysroot}" && tar Jcf "%{install-root}/bootstrap-image-%{target_arch}.tar.xz" .
