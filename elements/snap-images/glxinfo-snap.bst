kind: script

build-depends:
- snap-images/squashfs-tools.bst
- snap-images/glxinfo.bst

config:
  layout:
  - element: snap-images/squashfs-tools.bst
    destination: '/'
  - element: snap-images/glxinfo.bst
    destination: '%{build-root}'

  commands:
  - |
    mksquashfs "%{build-root}" "%{install-root}/glxinfo.snap" \
        -root-owned -noappend -comp lzo -no-xattrs -no-fragments
