kind: import
description: Import bootstrapped image
sources:
- kind: localtar
  (?):
  - target_arch == "x86_64":
      path: bootstrap-image-x86_64.tar.gz
  - target_arch == "i586":
      path: bootstrap-image-i586.tar.gz
  - target_arch == "arm":
      path: bootstrap-image-arm.tar.gz
  - target_arch == "aarch64":
      path: bootstrap-image-aarch64.tar.gz
