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
  builddir: ''
  conf-local: >-
    --with-drivers=ALL

  (?):
  - target_arch == "aarch64":
      # May fail to build on some builders or run on some machines otherwise
      local_flags: -DPNG_ARM_NEON_OPT=0


sources:
- kind: git_tag
  url: ghostscript:ghostpdl.git
  track: ghostscript-9.52
  match:
  - 'ghostscript-*'
  ref: ghostscript-9.52-0-ge49830f8efdbc3a9f4e8acaf708b68a742f515aa
