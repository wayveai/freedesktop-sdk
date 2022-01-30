kind: cmake

build-depends:
- filename: public-stacks/buildsystem-cmake.bst

depends:
- filename: bootstrap-import.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_STATIC_LIBS=OFF
    -DOPENJPEG_INSTALL_LIB_DIR=%{lib}
  local_flags: -fvisibility=hidden

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopenjp2.so'
        - '%{libdir}/openjpeg-2.3'
        - '%{libdir}/openjpeg-2.3/**'
  cpe:
    patches:
    - CVE-2019-12973
    - CVE-2020-8112

sources:
- kind: git_tag
  url: github:uclouvain/openjpeg.git
  ref: v2.3.1-0-g57096325457f96d8cd07bd3af04fe81d7a2ba788
- kind: patch
  path: patches/openjpeg/0001-convertbmp-detect-invalid-file-dimensions-early.patch
- kind: patch
  path: patches/openjpeg/0001-bmp_read_rle4_data-avoid-potential-infinite-loop.patch
- kind: patch
  path: patches/openjpeg/0001-opj_tcd_init_tile-avoid-integer-overflow.patch
