kind: script

depends:
  - filename: dependencies/base-sdk.bst
    type: build
  - filename: bootstrap.bst
    type: build

variables:
  root: /buildstream/install
  install-root: "%{root}/%{sysroot}"

config:
  layout:
    - element: bootstrap.bst
      destination: "%{root}"
    - element: dependencies/base-sdk.bst
      destination: /

  commands:
    - |
      for f in /etc/rpc /var/db/Makefile; do
        target="%{install-root}/usr$(dirname "$f")"
        [ -d "${target}" ] || mkdir -p "${target}"
        mv "%{install-root}$f" "${target}"
      done

    - |
      for f in /bin /sbin /etc /var; do
        rm -rf "%{install-root}$f"
        ln -s "usr$f" "%{install-root}$f"
      done

    - |
      ln -s bin "%{install-root}/usr/sbin"

    - |
      for i in lib lib32 lib64; do
        libdir="%{install-root}/${i}"
        targetdir="%{install-root}/usr/${i}"
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
