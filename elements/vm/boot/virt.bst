kind: script

build-depends:
- vm/boot/virt/deps.bst
- vm/boot/virt/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  install-root: /boot

config:

  layout:
  - element: ''
    destination: '/tmp'
  - element: ''
    destination: '/var/tmp'
  - element: ''
    destination: '/boot'
  - element: vm/boot/virt/deps.bst
    destination: '/'
  - element: vm/boot/virt/initial-scripts.bst
    destination: '/'
  - element: vm/prepare-image.bst
    destination: '/'

  commands:
  - |
    prepare-image.sh --rootpasswd root --seed "%{uuidnamespace}" \
                     --noboot \
                     --rootfstype 9p \
                     --rootsource virtfs \
                     >/tmp/vars

  - |
    dracut -v --fstab \
           --no-machineid \
           --kver $(ls -1 /lib/modules | head -n1) \
           --add "virtfs" \
           --gzip \
           /boot/initramfs.gz
