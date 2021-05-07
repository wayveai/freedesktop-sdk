kind: manual

build-depends:
- public-stacks/buildsystem-cmake.bst
- extensions/rust/rust-stage1.bst
- components/python3.bst

depends:
- components/libxml2.bst
- extensions/mesa/llvm.bst

variables:
  optimize-debug: "false"

  debuginfo-level: '2'
  debuginfo-level-std: '0'
  rust-target: '%{host-triplet}'
  llvm-targets: 'AArch64;ARM;Hexagon;MSP430;Mips;NVPTX;PowerPC;Sparc;SystemZ;WebAssembly;X86'
  (?):
  - target_arch == "i686":
      # i686 also exhausts memory on stage0
      debuginfo-level: '0'
      debuginfo-level-std: '2'
      llvm-targets: 'X86'
  - target_arch == "x86_64":
      llvm-targets: 'X86'
  - target_arch == "arm":
      rust-target: armv7-unknown-linux-gnueabihf
      # armv7 exhausts memory on stage0 librustc w/ debuginfo
      # github:rust-lang/rust/issues/45854
      debuginfo-level: '0'
      debuginfo-level-std: '2'
      llvm-targets: 'ARM'
  - target_arch == "aarch64":
      llvm-targets: 'AArch64'
  - target_arch == "ppc64le":
      llvm-targets: 'PowerPC'

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
    targets = "%{llvm-targets}"
    # disable experimental targets, we certainly don't want them (only AVR at the moment)
    experimental-targets = ""
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
    tools = ["cargo"]
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

sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rustc-1.52.0-src.tar.xz
  ref: 2393e923087f3f8f98190eb0743f1b4a8956a35274ae5d3c0fae6e43238c6af8
