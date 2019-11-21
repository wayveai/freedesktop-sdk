kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_C_FLAGS_RELEASE:STRING=-DNDEBUG \
    -DCMAKE_CXX_FLAGS_RELEASE:STRING=-DNDEBUG \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DINCLUDE_INSTALL_DIR:PATH=%{includedir} \
    -DLIB_INSTALL_DIR:PATH=%{libdir} \
    -DSYSCONF_INSTALL_DIR:PATH=/etc \
    -DSHARE_INSTALL_PREFIX:PATH=%{datadir} \
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

sources:
- kind: git_tag
  url: github:libproxy/libproxy.git
  track: master
  ref: 0.4.15-0-g5924d4223e2b7238607749d977c0a878fe33cdbc
