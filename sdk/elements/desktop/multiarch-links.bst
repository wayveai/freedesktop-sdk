kind: manual

depends:
  - filename: bootstrap-import.bst

config:
  (?):
    - target_arch == "x86_64":
        install-commands:
          - |
            mkdir -p %{install-root}/usr/lib
            ln -s i386-linux-gnu/ld-2.27.so %{install-root}/usr/lib/ld-linux.so.2
            ln -s /app/lib/i386-linux-gnu %{install-root}/usr/lib/i386-linux-gnu

    - target_arch == "aarch64":
        install-commands:
          - |
            mkdir -p %{install-root}/usr/lib
            ln -s arm-linux-gnu/ld-2.27.so %{install-root}/usr/lib/ld-linux-armhf.so.3
            ln -s /app/lib/arm-linux-gnueabihf %{install-root}/usr/lib/arm-linux-gnueabihf
