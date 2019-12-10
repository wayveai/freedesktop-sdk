kind: manual

depends:
- filename: bootstrap-import.bst
- filename: desktop/llvm7.bst
  type: build
- filename: desktop/llvm7-static.bst
  type: build
- filename: base/python3.bst
  type: build

config:
  configure-commands:
    - |
      ./configure.py \
      --prefix=%{prefix} \
      --pkgconfigdir=%{libdir}/pkgconfig \
      --with-cxx-compiler=%{bindir}/g++

  build-commands:
    - |
      make

  install-commands:
    - |
      make -j1 DESTDIR="%{install-root}" install

sources:
  # libclc uses an svn repo, and the git seems to only be a mirror.
  # We want to use an svn plugin.
  # This is a specific commit in master, where the copyright was updated to 
  # 2018, I could see nothing else remotely release-like.
- kind: git 
  url: llvm:libclc.git
  ref: e6e24bf34143a3d4c225376efe7eef69ead9ac7b # No git describe, no tags...
- kind: patch
  path: patches/libclc/libclc-force-configure-to-use-python3.patch
