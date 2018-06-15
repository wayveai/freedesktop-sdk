kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: rust/rust-stage1.bst
    type: build
  - filename: base/ninja.bst
    type: build
  - filename: base/cmake.bst
    type: build
  - filename: base/python3.bst
    type: build
  - filename: desktop/llvm6.bst
  - filename: base/libxml2.bst

variables:
  prefix: "/usr/lib/sdk/rust"
  lib: "lib"
  debugdir: "/usr/lib/debug"

  # ThinLTO takes a lot of memory. We disable it for some architectures.
  thinlto: "true"
  debuginfo-only-std: "false"
  rust-target: "%{host-triplet}"
  (?):
    - target_arch == "i586":
        thinlto: "false"
    - target_arch == "arm":
        thinlto: "false"
        rust-target: "armv7-unknown-linux-gnueabihf"
        # armv7 exhausts memory on stage0 librustc w/ debuginfo
        # https://github.com/rust-lang/rust/issues/45854
        debuginfo-only-std: "true"

config:
  configure-commands:
    - |
      cat <<EOF >config.toml
      [llvm]
      link-shared = true
      [build]
      build = "%{rust-target}"
      host = ["%{rust-target}"]
      target = ["%{rust-target}"]
      cargo = "/usr/bin/cargo"
      rustc = "/usr/bin/rustc"
      submodules = false
      python = "/usr/bin/python3"
      locked-deps = true
      vendor = true
      verbose = 2
      [install]
      prefix = "%{prefix}"
      sysconfdir = "%{sysconfdir}"
      bindir = "%{bindir}"
      libdir = "%{libdir}"
      datadir = "%{datadir}"
      infodir = "%{infodir}"
      localstatedir = "%{localstatedir}"
      mandir = "%{mandir}"
      docdir = "%{datadir}/doc/rust"
      [rust]
      debuginfo = true
      debuginfo-only-std = %{debuginfo-only-std}
      use-jemalloc = true
      rpath = false
      thinlto = %{thinlto}
      default-linker = "/usr/bin/gcc"
      [target.%{rust-target}]
      cc = "/usr/bin/%{host-triplet}-gcc"
      cxx = "/usr/bin/%{host-triplet}-g++"
      linker = "/usr/bin/%{host-triplet}-gcc"
      ar = "/usr/bin/%{host-triplet}-gcc-ar"
      llvm-config = "/usr/bin/llvm-config"
      EOF

  build-commands:
    - |
      python3 x.py build -j%{max-jobs}

  install-commands:
    - |
      DESTDIR="%{install-root}" python3 x.py install

    - |
      rustlibdir="%{install-root}%{libdir}/rustlib/%{host-triplet}/lib"
      for lib in "${rustlibdir}/"lib*.so; do
        libname=$(basename "${lib}")
        runtimelib="%{install-root}%{libdir}/${lib}"
        if [ -f "${runtimelib}" ]; then
          rm "${lib}"
          ln -s "$(realpath "${runtimelib}" --relative-to="${rustlibdir}")" "${lib}"
        fi
      done

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{bindir}/*"
          - "%{libdir}/rustlib"
          - "%{libdir}/rustlib/**"

    integration-commands:
      - |
        echo "%{libdir}" >>/etc/ld.so.conf

      - |
        ldconfig

sources:
  - kind: tar
    url: https://static.rust-lang.org/dist/rustc-1.26.2-src.tar.gz
    ref: fb9ecf304488c9b56600ab20cfd1937482057f7e5db7899fddb86e0774548700
  - kind: patch
    path: patches/rust-codegen-libdir.patch
