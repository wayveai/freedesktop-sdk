kind: stack

depends:
- filename: bootstrap-import.bst

variables:
  compat_arch: arm-linux-gnueabihf
  entrypoint: ld-linux-armhf.so.3

public:
  bst:
    (?):
    - target_arch != "arm":
        integration-commands:
        - |
          mkdir -p /usr/lib
          ln -sf %{compat_arch}/%{entrypoint} /usr/lib/%{entrypoint}
