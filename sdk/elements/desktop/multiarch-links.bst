kind: manual

depends:
  - filename: base-stack.bst
    type: build

config:
  (?):
    - target_arch == "x86_64":
        install-commands:
          - |
            mkdir -p %{install-root}/lib
            ln -s /usr/lib/i386-linux-gnu/ld-linux.so.2 %{install-root}/lib/ld-linux.so.2

    - target_arch == "aarch64":
        install-commands:
          - |
            mkdir -p %{install-root}/lib
            ln -s /usr/lib/arm-linux-gnu/ld-linux-armhf.so.3 %{install-root}/lib/ld-linux-armhf.so.3
