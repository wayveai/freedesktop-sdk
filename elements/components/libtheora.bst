kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst

variables:
  autogen: ./autogen.sh --build %{conf-args}
  make: make -C ..
  make-install: make -j1 DESTDIR="%{install-root}" install -C ..

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
    if [ -n "%{build-dir}" ]; then
      mkdir %{build-dir}
      cd %{build-dir}
      reldir=..
    else
      reldir=.
    fi
    
sources:
- kind: git_tag
  url: xiph:theora.git
  track: master
  track-extra:
  - theora-1.1
  exclude:
  - '*alpha*'
  ref: v1.1.1-0-g7ffd8b2ecfc2d93ae5e16028e7528e609266bfbf
