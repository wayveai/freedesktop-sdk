kind: script

depends:
  - filename: dependencies/base-sdk.bst
    type: build
  - filename: bootstrap-platform.bst
    type: build

variables:
  root: "%{install-root}%{sysroot}"

config:
  layout:
    - element: bootstrap-platform.bst
      destination: "%{install-root}"
    - element: dependencies/base-sdk.bst
      destination: /

  commands:
    - |
      for f in /etc/rpc /var/db/Makefile; do
        target="%{root}/usr$(dirname "$f")"
        [ -d "${target}" ] || mkdir -p "${target}"
        mv "%{root}$f" "${target}"
      done

    - |
      for f in /bin /sbin /etc /var; do
        rm -rf "%{root}$f"
        ln -s "usr$f" "%{root}$f"
      done

    - |
      for i in lib lib32 lib64; do
        libdir="%{root}/${i}"
        targetdir="%{root}/usr/${i}"
        [ -d "${targetdir}" ] || mkdir -p "${targetdir}"
        if [ -d "${libdir}" ]; then
          for f in "${libdir}"/*; do
            if [ -h "$f" ]; then
              ln -s "$(realpath "${libdir}/$(readlink "$f")" --relative-to="${targetdir}")" "${targetdir}/$(basename "$f")"
              rm "$f"
            fi
          done
          rm -r "${libdir}"
        fi
        ln -s "usr/${i}" "${libdir}"
      done
