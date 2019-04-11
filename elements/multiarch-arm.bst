kind: stack

depends:
- filename: bootstrap-import.bst

variables:
  compat_arch: arm-linux-gnueabihf
  entrypoint: ld-linux-armhf.so.3

public:
  bst:
    (?):
    - target_arch == "arm":
        integration-commands:
        - |
          test %{gcc_triplet} = %{compat_arch}
          test -f %{indep-libdir}/%{entrypoint}
          if [ -L %{libdir}/%{entrypoint} ]; then
            [ "$(readlink "%{libdir}/%{entrypoint}")" = "$(realpath --relative-to="%{libdir}" "%{indep-libdir}/%{entrypoint}")" ]
          else
            ln -srL %{indep-libdir}/%{entrypoint} %{libdir}/%{entrypoint}
          fi

    - target_arch != "arm":
        integration-commands:
        - |
          mkdir -p /usr/lib
          ln -sf %{compat_arch}/%{entrypoint} /usr/lib/%{entrypoint}
