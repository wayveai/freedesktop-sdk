kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/clinfo.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/clinfo.bst
    destination: '%{build-root}'

  commands:
  - |
    mksquashfs "%{build-root}" "%{install-root}/clinfo.snap" \
        -root-owned -noappend -comp lzo -no-xattrs -no-fragments
