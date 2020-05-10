kind: filter
description: |
  This element replaces Jack library by a drop-in replacement so that
  Jack clients connects to Pipewire.
  This is not to be confused with the Jack plugin for Pipewire.

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
        - '%{libdir}/libjack-pw.so'

    integration-commands:
    - rm -f "%{libdir}"/libjack.so*
    - ln -sf libjack-pw.so.0.3.1 "%{libdir}/libjack.so.0"
