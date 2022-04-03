kind: script

build-depends:
- vm/boot/efi-secure/deps.bst
- vm/boot/efi-secure/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6

  efi-arch: "%{arch}"
  (?):
  - target_arch == "x86_64":
      efi-arch: x64
  - target_arch == "i686":
      efi-arch: ia32

config:

  layout:
  - element: ''
    destination: '/tmp'
  - element: ''
    destination: '/var/tmp'
  - element: ''
    destination: '/boot'
  - element: vm/boot/efi-secure/deps.bst
    destination: '/'
  - element: vm/boot/efi-secure/initial-scripts.bst
    destination: '/'
  - element: vm/prepare-image.bst
    destination: '/'

  commands:
  - |
    prepare-image.sh --sysroot / --rootpasswd root \
                     --seed "%{uuidnamespace}" >/tmp/vars

  - dbus-uuidgen >/etc/machine-id
  - SYSTEMD_RELAX_ESP_CHECKS=1 bootctl --path='/boot' --no-variables install
  - rm /etc/machine-id

  - |
    dracut -v --fstab \
           --uefi \
           --no-machineid --kernel-image /boot/vmlinuz \
           --kver $(ls -1 /lib/modules | head -n1) \
           --kernel-cmdline "rw console=tty0 console=ttyS0 quiet" \
           --install 'fsck.ext4'

  - mkdir -p "%{install-root}/usr/lib/modules"
  - cp -rT /usr/lib/modules "%{install-root}/usr/lib/modules"

  - mkdir -p "%{install-root}/boot/EFI"
  - cp -rT /boot/EFI "%{install-root}/boot/EFI"
