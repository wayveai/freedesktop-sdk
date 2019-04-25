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
- filename: components/llvm7.bst
- filename: components/libxml2.bst

variables:
  prefix: /usr/lib/sdk/rust
  lib: lib
  debugdir: /usr/lib/debug

  debuginfo-only-std: 'false'
  rust-target: '%{host-triplet}'
  (?):
  - target_arch == "i686":
        # i686 also exhausts memory on stage0
      debuginfo-only-std: 'true'
  - target_arch == "arm":
      rust-target: armv7-unknown-linux-gnueabihf
        # armv7 exhausts memory on stage0 librustc w/ debuginfo
        # github:rust-lang/rust/issues/45854
      debuginfo-only-std: 'true'

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
    channel = "stable"
    debuginfo = true
    debuginfo-only-std = %{debuginfo-only-std}
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
  url: https://static.rust-lang.org/dist/rustc-1.34.1-src.tar.gz
  ref: b0c785264d17e1dac4598627c248a2d5e07dd39b6666d1881fcfc8e2cf4c40a7
- kind: patch
  path: patches/rust/rust-codegen-libdir.patch
- kind: patch
  path: patches/rust/rust-cannonicalize-install.patch
