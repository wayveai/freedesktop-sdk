kind: import
description: Import bootstrapped image
sources:
- kind: local
  (?):
  - target_arch == "x86_64":
      path: bootstrap-image-x86_64
  - target_arch == "i586":
      path: bootstrap-image-i586
  - target_arch == "arm":
      path: bootstrap-image-arm
  - target_arch == "aarch64":
      path: bootstrap-image-aarch64
