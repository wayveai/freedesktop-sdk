kind: stack

variables:
  (?):
  - (target_arch == "i686" or target_arch ==  "x86_64"):
      compat_arch: i386-linux-gnu
      entrypoint: ld-linux.so.2

  - (target_arch == "aarch64" or target_arch == "arm"):
      compat_arch: arm-linux-gnueabihf
      entrypoint: ld-linux-armhf.so.3

depends:
- filename: bootstrap-import.bst

public:
  bst:
    (?):
    - (target_arch == "x86_64" or target_arch == "aarch64"):
        integration-commands:
        - |
          mkdir -p /usr/lib
          ln -sf %{compat_arch}/%{entrypoint} /usr/lib/%{entrypoint}
          ln -sf /app/lib/%{compat_arch} /usr/lib/%{compat_arch}

    - (target_arch == "i686" or target_arch == "arm"):
        integration-commands:
        - |
          test %{gcc_triplet} = %{compat_arch}
          ln -srL %{indep-libdir}/%{entrypoint} %{libdir}/%{entrypoint}

