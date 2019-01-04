kind: autotools
description: GNU gcc Stage 2

depends:
- filename: bootstrap/build/gcc-stage-2-build-deps.bst
  type: build

- filename: bootstrap/build/binutils-stage1.bst
  type: runtime

(@): elements/bootstrap/build.yml

variables:
  conf-link-args: |
    --enable-shared \
    --enable-static
  prefix: '%{tools}'
  lib: lib
  (?):
  - target_arch == "arm":
      conf-extra: |
        --with-mode=thumb \
        --with-fpu=vfpv3-d16 \
        --with-arch=armv7-a \
        --with-float=hard

  conf-local: |
    --target=%{triplet} \
    --enable-multiarch \
    --disable-multilib \
    --disable-bootstrap \
    --disable-nls \
    --with-sysroot=%{sysroot} \
    --enable-languages=c,c++,fortran \
    --enable-default-pie \
    --enable-default-ssp \
    --without-isl \
    --enable-deterministic-archives \
    --enable-linker-build-id \
    %{conf-extra}

  # strip-binaries fails when cross compiling because artifact
  # contains 2 architectures.
  strip-binaries: "true"

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/%{triplet}-c++"
      ln -s "%{triplet}-g++" "%{install-root}%{bindir}/%{triplet}-c++"

    - |
      rm "%{install-root}%{bindir}/%{triplet}-gcc"
      ln -s "%{triplet}-gcc-$(cat gcc/BASE-VER)" "%{install-root}%{bindir}/%{triplet}-gcc"

    - |
      for f in "%{install-root}%{bindir}/"*; do
        base="$(basename "${f}")"
        case "${base}" in
          %{triplet}-*)
            continue
          ;;
          *)
            if [ -f "%{install-root}%{bindir}/%{triplet}-${base}" ]; then
              rm "${f}"
              ln -s "%{triplet}-${base}" "${f}"
            fi
          ;;
        esac
      done

sources:
- kind: tar
  url: ftp_gnu_org:gcc/gcc-8.3.0/gcc-8.3.0.tar.xz
  ref: 64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c
- kind: tar
  url: ftp_gnu_org:gmp/gmp-6.1.2.tar.xz
  directory: gmp
  ref: 87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912
- kind: tar
  url: ftp_gnu_org:mpfr/mpfr-4.0.2.tar.xz
  directory: mpfr
  ref: 1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a
- kind: tar
  url: ftp_gnu_org:mpc/mpc-1.1.0.tar.gz
  directory: mpc
  ref: 6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e
- kind: patch
  path: patches/gcc/gcc-multiarch-os-dir.patch
