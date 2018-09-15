kind: manual

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: extensions/rust/rust-stage1.bst
    type: build
  - filename: base/buildsystem-cmake.bst
    type: build
  - filename: base/python3.bst
    type: build
  - filename: desktop/llvm6.bst
  - filename: base/libxml2.bst

variables:
  prefix: "/usr/lib/sdk/rust"
  lib: "lib"
  debugdir: "/usr/lib/debug"

  debuginfo-only-std: "false"
  rust-target: "%{host-triplet}"
  (?):
    - target_arch == "i686":
        # i686 also exhausts memory on stage0
        debuginfo-only-std: "true"
    - target_arch == "arm":
        rust-target: "armv7-unknown-linux-gnueabihf"
        # armv7 exhausts memory on stage0 librustc w/ debuginfo
        # https://github.com/rust-lang/rust/issues/45854
        debuginfo-only-std: "true"

environment-nocache:
  - MAXJOBS

environment:
  MAXJOBS: "%{max-jobs}"

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
      python3 x.py build -j${MAXJOBS}

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
    url: https://static.rust-lang.org/dist/rustc-1.29.2-src.tar.gz
    ref: 5088e796aa2e47478cdf41e7243fc5443fafab0a7c70a11423e57c80c04167c9
  - kind: patch
    path: patches/rust-codegen-libdir.patch
  - kind: patch
    path: patches/rust-cannonicalize-install.patch
