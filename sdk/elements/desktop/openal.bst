kind: cmake

depends:
  - filename: base-stack.bst

variables:
  cmake-extra: |
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR:PATH=%{libdir} \

public:
  bst:
    split-rules:
      devel:
        - "%{bindir}/alrecord"
        - "%{bindir}/altonegen"
        - "%{bindir}/bsincgen"
        - "%{bindir}/makehrtf"
        - "%{bindir}/openal-info"
        - "%{libdir}/libopenal.so"

sources:
  - kind: tar
    url: http://kcat.strangesoft.net/openal-releases/openal-soft-1.18.2.tar.bz2
    ref: 9f8ac1e27fba15a59758a13f0c7f6540a0605b6c3a691def9d420570506d7e82
