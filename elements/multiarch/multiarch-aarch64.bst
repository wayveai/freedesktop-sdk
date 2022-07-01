kind: stack

depends:
- filename: bootstrap-import.bst

variables:
  compat_arch: aarch64-linux-gnu
  entrypoint: ld-linux-aarch64.so.1

public:
  bst:
    (?):
    - target_arch != "aarch64":
        integration-commands:
        - |
          mkdir -p /usr/lib
          ln -sf %{compat_arch}/%{entrypoint} /usr/lib/%{entrypoint}
