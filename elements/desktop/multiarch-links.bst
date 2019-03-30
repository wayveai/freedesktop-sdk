kind: stack

depends:
- filename: bootstrap-import.bst

variables:
  ld_so: ld-2.28.so

public:
  bst:
    (?):
    - target_arch == "x86_64":
        integration-commands:
        - |
          test -f %{libdir}/%{ld_so}
          mkdir -p /usr/lib
          ln -sf i386-linux-gnu/%{ld_so} /usr/lib/ld-linux.so.2
          ln -sf /app/lib/i386-linux-gnu /usr/lib/i386-linux-gnu

    - target_arch == "aarch64":
        integration-commands:
        - |
          test -f %{libdir}/%{ld_so}
          mkdir -p /usr/lib
          ln -sf arm-linux-gnueabihf/%{ld_so} /usr/lib/ld-linux-armhf.so.3
          ln -sf /app/lib/arm-linux-gnueabihf /usr/lib/arm-linux-gnueabihf

    - ('86' in target_arch and target_arch != "x86_64"):
        integration-commands:
        - |
          test %{gcc_triplet} = i386-linux-gnu
          test -f /usr/lib/i386-linux-gnu/%{ld_so}

    - ('arm' in target_arch):
        integration-commands:
        - |
          test %{gcc_triplet} = arm-linux-gnueabihf
          test -f /usr/lib/arm-linux-gnueabihf/%{ld_so}
