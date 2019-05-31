kind: autotools
description: GNU gcc Stage 2

depends:
- filename: bootstrap/build/gcc-stage-2-build-deps.bst
  type: build

- filename: bootstrap/build/binutils-stage1.bst
  type: runtime

(@):
- elements/bootstrap/gcc-arch-opts.yml
- elements/bootstrap/gcc-source.yml

environment:
  (?):
    - target_arch == "x86_64":
        CFLAGS_FOR_TARGET:  "%{target_flags_x86_64}"
        CXXFLAGS_FOR_TARGET: "%{target_flags_x86_64}"
        LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"
    - target_arch == "i686":
        CFLAGS_FOR_TARGET: "%{target_flags_i686}"
        CXXFLAGS_FOR_TARGET: "%{target_flags_i686}"
        LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"
    - target_arch == "arm":
        CFLAGS_FOR_TARGET:  "%{target_flags_arm}"
        CXXFLAGS_FOR_TARGET: "%{target_flags_arm}"
        LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"
    - target_arch == "aarch64":
        CFLAGS_FOR_TARGET:  "%{target_flags_aarch64}"
        CXXFLAGS_FOR_TARGET: "%{target_flags_aarch64}"
        LDFLAGS_FOR_TARGET:  "%{ldflags_defaults}"
    - bootstrap_build_arch == "x86_64":
        CFLAGS_FOR_BUILD:  "%{build_flags_x86_64}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_x86_64}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"
    - bootstrap_build_arch == "i686":
        CFLAGS_FOR_BUILD: "%{build_flags_i686}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_i686}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"
    - bootstrap_build_arch == "arm":
        CFLAGS_FOR_BUILD:  "%{build_flags_arm}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_arm}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"
    - bootstrap_build_arch == "aarch64":
        CFLAGS_FOR_BUILD:  "%{build_flags_aarch64}"
        CXXFLAGS_FOR_BUILD: "%{build_flags_aarch64}"
        LDFLAGS_FOR_BUILD:  "%{ldflags_defaults}"

variables:
  build-triplet: '%{guessed-triplet}'
  host-triplet: '%{guessed-triplet}'
  conf-link-args: |
    --enable-shared \
    --enable-static
  prefix: '%{tools}'
  lib: lib

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

    - |
      rm "%{install-root}%{infodir}/dir"
