kind: script

build-depends:
- vm/minimal/filesystem.bst
- vm/minimal/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  install-root: /sysroot

config:
  layout:
  - element: ''
    destination: '/tmp'
  - element: 'vm/minimal/filesystem.bst'
    destination: '/sysroot'
  - element: 'vm/minimal/initial-scripts.bst'
    destination: '/'
  - element: 'vm/prepare-image.bst'
    destination: '/'

  commands:
  - |
    prepare-image.sh --rootpasswd root --seed "%{uuidnamespace}" \
                     --sysroot /sysroot \
                     --noboot \
                     --rootfstype 9p \
                     --rootsource virtfs \
                     >/tmp/vars
