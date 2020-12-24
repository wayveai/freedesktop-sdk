kind: stack
description: |
  This element replaces Jack library by a drop-in replacement so that
  Jack clients connects to Pipewire.
  This is not to be confused with the Jack plugin for Pipewire.

depends:
- components/pipewire-libjack-manual.bst

public:
  bst:
    integration-commands:
    - rm -f "%{libdir}"/libjack.so*
    - rm -f "%{libdir}"/libjacknet.so*
    - rm -f "%{libdir}"/libjackserver.so*
    - ln -sf pipewire-0.3/jack/libjack.so.0 "%{libdir}/libjack.so.0"
    - ln -sf pipewire-0.3/jack/libjackserver.so.0 "%{libdir}/libjackserver.so.0"
    - ln -sf pipewire-0.3/jack/libjacknet.so.0 "%{libdir}/libjacknet.so.0"
