kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DINCLUDE_INSTALL_DIR:PATH=%{includedir} \
    -DLIB_INSTALL_DIR:PATH=%{libdir} \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DMODULE_INSTALL_DIR=%{libdir}/libproxy/0.4.11/modules \
    -DWITH_PERL=OFF \
    -DWITH_GNOME3=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libproxy.so'
        - '%{datadir}/cmake'
        - '%{datadir}/cmake/**'

sources:
- kind: git_tag
  url: github:libproxy/libproxy.git
  track: master
  ref: 0.4.16-0-g0da9e01980a93aa13c40de492dca3c47cde50bfc
