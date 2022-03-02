kind: script

build-depends:
- bootstrap-import.bst

variables:
  compat_arch: arm-linux-gnueabihf
  entrypoint: ld-linux-armhf.so.3

config:
  (?):
  - target_arch != "arm":
      commands:
      - |
        mkdir -p %{install-root}%{indep-libdir}
        ln -sf %{compat_arch}/%{entrypoint} %{install-root}%{indep-libdir}%{entrypoint}

