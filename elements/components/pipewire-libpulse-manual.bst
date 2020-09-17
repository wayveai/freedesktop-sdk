kind: filter

build-depends:
- components/pipewire-base.bst

runtime-depends:
- components/pipewire-daemon.bst

config:
  include:
  - libpulse
  include-orphans: False

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/pipewire-0.3/pulse/libpulse.so'
        - '%{libdir}/pipewire-0.3/pulse/libpulse-simple.so'
        - '%{libdir}/pipewire-0.3/pulse/libpulse-mainloop-glib.so'
