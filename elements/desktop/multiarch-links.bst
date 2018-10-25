kind: stack

depends:
- filename: bootstrap-import.bst

public:
  bst:
    (?):
    - target_arch == "x86_64":
        integration-commands:
        - |
          mkdir -p /usr/lib
          ln -sf i386-linux-gnu/ld-2.27.so /usr/lib/ld-linux.so.2
          ln -sf /app/lib/i386-linux-gnu /usr/lib/i386-linux-gnu

    - target_arch == "aarch64":
        integration-commands:
        - |
          mkdir -p /usr/lib
          ln -sf arm-linux-gnu/ld-2.27.so /usr/lib/ld-linux-armhf.so.3
          ln -sf /app/lib/arm-linux-gnueabihf /usr/lib/arm-linux-gnueabihf
