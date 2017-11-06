kind: import

sources:
  - kind: localtar
    (?):
      - target_arch == "x86_64":
          path: bootstrap-image-platform-x86_64.tar.gz
      - target_arch == "i586":
          path: bootstrap-image-platform-i586.tar.gz
      - target_arch == "arm":
          path: bootstrap-image-platform-arm.tar.gz
      - target_arch == "aarch64":
          path: bootstrap-image-platform-aarch64.tar.gz
