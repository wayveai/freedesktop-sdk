kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/freetype.bst
- components/libpaper.bst
- components/jpeg.bst
- components/lcms.bst
- components/libtiff.bst
- components/xorg-lib-xt.bst

variables:
  conf-local: >-
    --with-drivers=ALL
    --with-system-libtiff

  (?):
  - target_arch == "aarch64":
      # May fail to build on some builders or run on some machines otherwise
      local_flags: -DPNG_ARM_NEON_OPT=0
  - target_arch == "ppc64le":
      # bundled libpng somehow fails to build because it cannot find some VSX-specific function
      # while it should find it, temporarily disabling VSX optimizations
      # See: https://gitlab.gnome.org/GNOME/gnome-build-meta/-/merge_requests/715#note_870364
      local_flags: -DPNG_POWERPC_VSX_OPT=0

sources:
- kind: git_tag
  url: ghostscript:ghostpdl.git
  track: ghostscript-9.52
  match:
  - 'ghostscript-*'
  ref: ghostscript-9.52-0-ge49830f8efdbc3a9f4e8acaf708b68a742f515aa
- kind: patch
  path: patches/ghostscript/autoconf-fix.patch
