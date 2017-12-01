kind: import

sources:
  - kind: local
    (?):
      - target_arch == "x86_64":
          path: bootstrap-image-platform-x86_64
      - target_arch == "i586":
          path: bootstrap-image-platform-i586
      - target_arch == "arm":
          path: bootstrap-image-platform-arm
      - target_arch == "aarch64":
          path: bootstrap-image-platform-aarch64
