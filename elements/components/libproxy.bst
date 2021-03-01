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
  ref: 0.4.17-0-ge78a5ccfe0a2340f2c73e419767f8492ffc2787a
