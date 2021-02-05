kind: re_import
sources:
- kind: local
  (?):
  - target_arch == "x86_64":
      path: bootstrap/go-x86_64
  - target_arch == "aarch64":
      path: bootstrap/go-aarch64
  - target_arch == "i686":
      path: bootstrap/go-i686
  - target_arch == "arm":
      path: bootstrap/go-arm
  - target_arch == "ppc64le":
      path: bootstrap/go-ppc64le
