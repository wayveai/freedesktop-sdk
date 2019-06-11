kind: autotools
description: GNU gcc Stage 3

depends:
- filename: bootstrap/gcc-build-deps.bst
  type: build
- filename: bootstrap/binutils.bst
  type: runtime
- filename: bootstrap/glibc.bst
  type: runtime

(@):
- elements/bootstrap/gcc-arch-opts.yml
- elements/bootstrap/gcc-source.yml

environment:
  PATH: "%{tools}/bin:/bin"
  CFLAGS: ''
  CXXFLAGS: ''
  LDFLAGS: ''
  CC_FOR_TARGET: '%{tools}/bin/%{triplet}-gcc'
  CXX_FOR_TARGET: '%{tools}/bin/%{triplet}-g++'
  AR_FOR_TARGET: '%{tools}/%{triplet}/bin/ar'
  AS_FOR_TARGET: '%{tools}/%{triplet}/bin/as'
  LD_FOR_TARGET: '%{tools}/%{triplet}/bin/ld'
  NM_FOR_TARGET: '%{tools}/%{triplet}/bin/nm'
  RANLIB_FOR_TARGET: '%{tools}/%{triplet}/bin/ranlib'
  (?):
    - bootstrap_build_arch == target_arch:
        CC: '%{bindir}/gcc'
        CXX: '%{bindir}/g++'
        AR: '%{bindir}/ar'
        AS: '%{bindir}/as'
        LD: '%{bindir}/ld'
        NM: '%{bindir}/nm'
        RANLIB: '%{bindir}/ranlib'
    - bootstrap_build_arch != target_arch:
        CC_FOR_BUILD: '%{bindir}/gcc'
        CXX_FOR_BUILD: '%{bindir}/g++'
        AR_FOR_BUILD: '%{bindir}/ar'
        AS_FOR_BUILD: '%{bindir}/as'
        LD_FOR_BUILD: '%{bindir}/ld'
        NM_FOR_BUILD: '%{bindir}/nm'
        RANLIB_FOR_BUILD: '%{bindir}/ranlib'

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
  host-triplet: '%{triplet}'
  build-triplet: '%{guessed-triplet}'

  # gcc installs correctly libraries in the multiarch library
  # directory, but needs to be provided /usr/lib for --libdir.
  lib: lib
  multiarch_libdir: '%{prefix}/lib/%{gcc_triplet}'

  conf-local: |
    --target=%{triplet} \
    --disable-multilib \
    --enable-multiarch \
    --disable-bootstrap \
    --with-build-sysroot=%{sysroot} \
    --enable-languages=c,c++,fortran \
    --enable-default-pie \
    --enable-default-ssp \
    --without-isl \
    --enable-linker-build-id \
    host_configargs='lt_cv_sys_lib_dlsearch_path_spec="/usr/lib/%{gcc_triplet}"' \
    target_configargs='lt_cv_sys_lib_dlsearch_path_spec="/usr/lib/%{gcc_triplet}"' \
    %{conf-extra}

  conf-link-args: |
    --enable-shared

config:
  install-commands:
    (>):
    - |
      ln -s gcc %{install-root}%{bindir}/cc

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
      find "%{install-root}" -name "lib*.a" -not -name "libgcc.a" -not -name "libgcc_eh.a" -not -name "libstdc++.a" -not -name "libstdc++fs.a"  -exec rm {} ";"

    - |
      rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      runtime:
        - '%{multiarch_libdir}/lib*.so.*'

      devel:
        (>):
        - '%{bindir}/*'
        - '%{libexecdir}'
        - '%{libexecdir}/**'
        - '%{datadir}/man'
        - '%{datadir}/man/**'
        - '%{datadir}/info'
        - '%{datadir}/info/**'
        - '%{datadir}/locale'
        - '%{datadir}/locale/**'
        - '%{indep-libdir}/gcc'
        - '%{indep-libdir}/gcc/**'
        - '%{libdir}/gcc'
        - '%{libdir}/gcc/**'
        - '%{multiarch_libdir}/lib*.a'
        - '%{multiarch_libdir}/liblsan.so'
        - '%{multiarch_libdir}/libstdc++.so'
        - '%{multiarch_libdir}/libgomp.so'
        - '%{multiarch_libdir}/libatomic.so'
        - '%{multiarch_libdir}/libubsan.so'
        - '%{multiarch_libdir}/libquadmath.so'
        - '%{multiarch_libdir}/libitm.so'
        - '%{multiarch_libdir}/libtsan.so'
        - '%{multiarch_libdir}/libmpxwrappers.so'
        - '%{multiarch_libdir}/libmpx.so'
        - '%{multiarch_libdir}/libcilkrts.so'
        - '%{multiarch_libdir}/libssp.so'
        - '%{multiarch_libdir}/libasan.so'
        - '%{multiarch_libdir}/libgfortran.so'
        - '%{multiarch_libdir}/libcc1.so'
        - '%{multiarch_libdir}/libgcc_s.so'
