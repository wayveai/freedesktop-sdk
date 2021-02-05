kind: re_import
sources:
- kind: local
  (?):
  - target_arch == "x86_64":
      path: bootstrap/bootstrap-x86_64
  - target_arch == "aarch64":
      path: bootstrap/bootstrap-aarch64
  - target_arch == "i686":
      path: bootstrap/bootstrap-i686
  - target_arch == "arm":
      path: bootstrap/bootstrap-arm
  - target_arch == "ppc64le":
      path: bootstrap/bootstrap-ppc64le
  - target_arch == "riscv64":
      path: bootstrap/bootstrap-riscv64
