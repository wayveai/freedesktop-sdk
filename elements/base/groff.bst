kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
- filename: base/texinfo.bst
  type: build

config:
  build-commands:
    (<):
      # This is a workaround for a bug with parallel builds.
    - |
      cd "%{builddir}"
      make -j1 arch/misc

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:groff/groff-1.22.3.tar.gz
  ref: 3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6d828a5
- kind: patch
  path: patches/groff/groff-reproducible-build.patch
- kind: patch
  path: patches/groff/groff-reproducible-build-2.patch
