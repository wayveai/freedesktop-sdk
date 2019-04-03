kind: manual
description: Creates an architecture-specific directory for debugging

depends:
- filename: bootstrap-import.bst

config:
  (?):
  - target_arch == "x86_64":
      install-commands:
      - |
        mkdir -p "%{install-root}%{debugdir}%{indep-libdir}/i386-linux-gnu"

  - target_arch == "aarch64":
      install-commands:
      - |
        mkdir -p "%{install-root}%{debugdir}%{indep-libdir}/arm-linux-gnueabihf"
