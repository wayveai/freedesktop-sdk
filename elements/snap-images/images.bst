kind: script

depends:
- filename: bootstrap-import.bst
  type: build
- filename: snap-images/squashfs-tools.bst
  type: build

- filename: snap-images/platform.bst
  type: build
- filename: snap-images/vulkaninfo.bst
  type: build
- filename: snap-images/clinfo.bst
  type: build
- filename: snap-images/glxinfo.bst
  type: build

config:
  layout:
  - element: bootstrap-import.bst
    destination: '/'
  - element: snap-images/squashfs-tools.bst
    destination: '/'

  - element: snap-images/platform.bst
    destination: '/images/platform'
  - element: snap-images/vulkaninfo.bst
    destination: '/images/vulkaninfo'
  - element: snap-images/clinfo.bst
    destination: '/images/clinfo'
  - element: snap-images/glxinfo.bst
    destination: '/images/glxinfo'

  commands:
  - |
    mkdir -p "%{install-root}"
    for name in platform vulkaninfo clinfo glxinfo; do
      mksquashfs "/images/${name}" "%{install-root}/${name}.snap" \
        -root-owned -noappend -comp xz -no-xattrs -no-fragments
    done

