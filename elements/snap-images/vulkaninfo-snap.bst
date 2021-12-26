kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/vulkaninfo.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/vulkaninfo.bst
    destination: '%{build-root}'

  commands:
  - |
    mksquashfs "%{build-root}" "%{install-root}/vulkaninfo.snap" \
        -root-owned -noappend -comp lzo -no-xattrs -no-fragments
