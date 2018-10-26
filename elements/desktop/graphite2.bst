kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: desktop/xorg-lib-x11.bst
- filename: desktop/xorg-lib-xrandr.bst
- filename: desktop/wayland.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_C_FLAGS_RELEASE:STRING=-DNDEBUG \
    -DCMAKE_CXX_FLAGS_RELEASE:STRING=-DNDEBUG \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:PATH=%{prefix} \
    -DINCLUDE_INSTALL_DIR:PATH=%{includedir} \
    -DLIB_INSTALL_DIR:PATH=%{libdir} \
    -DSYSCONF_INSTALL_DIR:PATH=/etc \
    -DSHARE_INSTALL_PREFIX:PATH=%{datadir} \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DGRAPHITE2_COMPARE_RENDERER=OFF

config:
  install-commands:
    (>):
    - |
      install -d -m755 "%{install-root}%{libdir}"
      for pattern in '*.so' '*.so.*' 'pkgconfig'; do
        mv "%{install-root}%{prefix}/lib"/${pattern} "%{install-root}%{libdir}"
      done
      rm "%{install-root}%{prefix}/lib"/*.la

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgraphite2.so'

sources:
- kind: tar
  url: https://sourceforge.net/projects/silgraphite/files/graphite2/graphite2-1.3.11.tgz
  ref: bab92ed1844d6538e7e5bda76f6ac9aaf633e38b683983b942c78c8ce063ad7c
