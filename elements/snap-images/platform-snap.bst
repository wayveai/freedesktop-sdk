kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/platform.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/platform.bst
    destination: '%{build-root}'

  commands:
  - |
    mksquashfs "%{build-root}" "%{install-root}/platform.snap" \
        -root-owned -noappend -comp lzo -no-xattrs -no-fragments
