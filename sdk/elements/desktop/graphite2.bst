kind: cmake

depends:
  - filename: base-stack.bst
    type: build
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xrandr.bst
  - filename: desktop/wayland.bst

variables:
  cmake-extra: |
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
        - "%{libdir}/libgraphite2.so"

sources:
  - kind: tar
    url: https://sourceforge.net/projects/silgraphite/files/graphite2/graphite2-1.3.10.tgz
    ref: 90fde3b2f9ea95d68ffb19278d07d9b8a7efa5ba0e413bebcea802ce05cda1ae
