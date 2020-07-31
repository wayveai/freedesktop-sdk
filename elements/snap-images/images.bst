kind: script

build-depends:
- bootstrap-import.bst
- snap-images/squashfs-tools.bst

- snap-images/platform.bst
- snap-images/sdk.bst
- snap-images/vulkaninfo.bst
- snap-images/vainfo.bst
- snap-images/clinfo.bst
- snap-images/glxinfo.bst

config:
  layout:
  - element: bootstrap-import.bst
    destination: '/'
  - element: snap-images/squashfs-tools.bst
    destination: '/'

  - element: snap-images/platform.bst
    destination: '/images/platform'
  - element: snap-images/sdk.bst
    destination: '/images/sdk'
  - element: snap-images/vulkaninfo.bst
    destination: '/images/vulkaninfo'
  - element: snap-images/vainfo.bst
    destination: '/images/vainfo'
  - element: snap-images/clinfo.bst
    destination: '/images/clinfo'
  - element: snap-images/glxinfo.bst
    destination: '/images/glxinfo'

  commands:
  - |
    mkdir -p "%{install-root}"
    for name in platform sdk vulkaninfo vainfo clinfo glxinfo; do
      mksquashfs "/images/${name}" "%{install-root}/${name}.snap" \
        -root-owned -noappend -comp xz -no-xattrs -no-fragments
    done

