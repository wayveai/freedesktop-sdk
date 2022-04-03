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
        - '%{libdir}/openjpeg-2.4'
        - '%{libdir}/openjpeg-2.4/**'
  cpe:
    ignored:
    - CVE-2016-7163
    - CVE-2016-9675

sources:
- kind: git_tag
  url: github:uclouvain/openjpeg.git
  ref: v2.4.0-0-g37ac30ceff6640bbab502388c5e0fa0bff23f505
