kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst
- filename: components/automake.bst
- filename: components/libtool.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtheora.so'
        - '%{libdir}/libtheoraenc.so'
        - '%{libdir}/libtheoradec.so'

config:
  configure-commands:
  - |
    %{autogen}
  
  build-commands:
  - |
    make

  install-commands:
  - |
    make -j1 DESTDIR="%{install-root}" install
  
sources:
- kind: git_tag
  url: github:xiph/theora.git
  track: master
  track-extra:
  - theora-1.1
  exclude:
  - '*alpha*'
  ref: v1.1.1-0-g7ffd8b2ecfc2d93ae5e16028e7528e609266bfbf

