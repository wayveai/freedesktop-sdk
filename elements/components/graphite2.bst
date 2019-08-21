kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: components/xorg-lib-x11.bst
- filename: components/xorg-lib-xrandr.bst
- filename: components/wayland.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_C_FLAGS_RELEASE:STRING=-DNDEBUG \
    -DCMAKE_CXX_FLAGS_RELEASE:STRING=-DNDEBUG \
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
- kind: git_tag
  url: github:silnrsi/graphite
  track: master
  ref: 1.3.13-0-gb45f9b271214b95f3b42e5c9863eae4b0bfb7fd7
