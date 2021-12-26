kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/vainfo.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/vainfo.bst
    destination: '%{build-root}'

  commands:
  - |
    mksquashfs "%{build-root}" "%{install-root}/vainfo.snap" \
          -root-owned -noappend -comp lzo -no-xattrs -no-fragments
