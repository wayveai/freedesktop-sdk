kind: script

build-depends:
- vm/boot/efi/deps.bst
- vm/boot/efi/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  # FIXME: dracut uses wrong directory when using /efi
  install-root: '/boot'

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
  - element: vm/boot/efi/deps.bst
    destination: '/'
  - element: vm/boot/efi/initial-scripts.bst
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
    cat <<EOF >/boot/loader/loader.conf
    timeout 3
    editor yes
    console-mode keep
    EOF

  - |
    . /tmp/vars
    dracut -v --fstab \
           --no-machineid --kernel-image /boot/vmlinuz \
           --kver $(ls -1 /lib/modules | head -n1) \
           --kernel-cmdline "rw console=tty0 console=ttyS0 quiet root=UUID=${uuid_root}" \
           --install 'fsck.ext4'

  - |
    . /tmp/vars
    cat <<EOF >/boot/loader/entries/fdsdk.conf
    title Freedesktop SDK
    version 1
    options rw console=tty0 console=ttyS0 root=UUID=${uuid_root}
    linux /vmlinuz
    initrd /initramfs-$(ls -1 /lib/modules | head -n1).img
    EOF
