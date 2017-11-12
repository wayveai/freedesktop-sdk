kind: manual

depends:
  - filename: base-stack.bst
    type: build

config:
  (?):
    - target_arch == "x86_64":
        install-commands:
          - |
            mkdir -p %{install-root}/lib/i386-linux-gnu
            ln -s i386-linux-gnu/ld-2.26.so %{install-root}/lib/ld-linux.so.2

    - target_arch == "aarch64":
        install-commands:
          - |
            mkdir -p %{install-root}/lib/arm-linux-gnu
            ln -s arm-linux-gnu/ld-2.26.so %{install-root}/lib/ld-linux-armhf.so.3
