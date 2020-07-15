kind: manual

depends:
- filename: bootstrap-import.bst
  type: build
- filename: extensions/rust/rust-stage1.bst
  type: build
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/python3.bst
  type: build
- filename: components/llvm.bst
- filename: components/libxml2.bst
- filename: extensions/rust/ldconfig.bst

variables:
  prefix: /usr/lib/sdk/rust
  lib: lib
  debugdir: /usr/lib/debug
  optimize-debug: "false"

  debuginfo-level: 2
  debuginfo-level-std: 0
  rust-target: '%{host-triplet}'
  (?):
  - target_arch == "i686":
      # i686 also exhausts memory on stage0
      debuginfo-level: 0
      debuginfo-level-std: 2
  - target_arch == "arm":
      rust-target: armv7-unknown-linux-gnueabihf
      # armv7 exhausts memory on stage0 librustc w/ debuginfo
      # github:rust-lang/rust/issues/45854
      debuginfo-level: 0
      debuginfo-level-std: 2

environment-nocache:
- MAXJOBS

environment:
  MAXJOBS: '%{max-jobs}'

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
    docs = true
    submodules = false
    python = "/usr/bin/python3"
    locked-deps = true
    vendor = true
    verbose = 2
    extended = true
    tools = ["cargo", "rls", "clippy", "rustfmt", "analysis", "src"]
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
    optimize = true
    channel = "stable"
    debuginfo-level = %{debuginfo-level}
    debuginfo-level-std = %{debuginfo-level-std}
    debuginfo-level-tools = 2
    backtrace = true
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
        - '%{bindir}/*'
        - '%{libdir}/rustlib'
        - '%{libdir}/rustlib/**'

    integration-commands:
    - |
      echo "%{libdir}" >>/etc/ld.so.conf

    - |
      ldconfig

sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rustc-1.44.1-src.tar.xz
  ref: e0386295dd5f2c7842835a509e4c57989eec6c29f989a1c85478b0e06f9d38ea
- kind: patch
  path: patches/rust/rust-cannonicalize-install.patch
