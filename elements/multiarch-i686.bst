kind: stack

depends:
- filename: bootstrap-import.bst

variables:
  compat_arch: i386-linux-gnu
  entrypoint: ld-linux.so.2

public:
  bst:
    (?):
    - target_arch == "i686":
        integration-commands:
        - |
          test %{gcc_triplet} = %{compat_arch}
          test -f %{indep-libdir}/%{entrypoint}
          if [ -L %{libdir}/%{entrypoint} ]; then
            [ "$(readlink "%{libdir}/%{entrypoint}")" = "$(realpath --relative-to="%{libdir}" "%{indep-libdir}/%{entrypoint}")" ]
          else
            ln -srL %{indep-libdir}/%{entrypoint} %{libdir}/%{entrypoint}
          fi

    - target_arch != "i686":
        integration-commands:
        - |
          mkdir -p /usr/lib
          ln -sf %{compat_arch}/%{entrypoint} /usr/lib/%{entrypoint}
