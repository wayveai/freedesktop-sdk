kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/sdk.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/sdk.bst
    destination: '%{build-root}'

  commands:
  - |
    mksquashfs "%{build-root}" "%{install-root}/sdk.snap" \
        -root-owned -noappend -comp lzo -no-xattrs -no-fragments
