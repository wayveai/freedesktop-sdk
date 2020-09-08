kind: filter
build-depends:
- components/pipewire-base.bst

runtime-depends:
- components/pipewire.bst

config:
  include:
  - libjack
  include-orphans: False

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/pipewire-0.3/jack/libjack.so'
        - '%{libdir}/pipewire-0.3/jack/libjacknet.so'
        - '%{libdir}/pipewire-0.3/jack/libjackserver.so'
