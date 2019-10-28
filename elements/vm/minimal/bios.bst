kind: script

build-depends:
- vm/deploy-tools.bst
- vm/boot/bios.bst
- vm/minimal/filesystem.bst
- vm/minimal/initial-scripts.bst
- vm/prepare-image.bst


variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6

config:
  layout:
  - element: ''
    destination: '/tmp'
  - element: 'vm/deploy-tools.bst'
    destination: '/'
  - element: 'vm/boot/bios.bst'
    destination: '/boot'
  - element: 'vm/minimal/filesystem.bst'
    destination: '/sysroot'
  - element: 'vm/minimal/initial-scripts.bst'
    destination: '/'

  commands:
  - |
    prepare-image.sh \
       --sysroot /sysroot \
       --seed "%{uuidnamespace}" \
       --rootpasswd "root" \
       --efipath /boot >/tmp/vars

  - truncate -s 100M /tmp/boot.img
  - |
    . /tmp/vars
    mkfs.fat -F16 -i "${id_efi}" -n BOOT /tmp/boot.img
  - mcopy -s -i /tmp/boot.img /boot/* ::/

  - |
    syslinux --directory /syslinux/ --install /tmp/boot.img

  - truncate -s 1G /tmp/root.img
  - |
    . /tmp/vars
    mkfs.ext4 -L root -d /sysroot -U ${uuid_root} /tmp/root.img

  - |
    bootsize=$(($(stat -c "%s" /tmp/boot.img)/512))
    rootsize=$(($(stat -c "%s" /tmp/root.img)/512))
    truncate -s $(((2048+${bootsize}+${rootsize})*512)) '%{install-root}/disk.img'
    startboot=2048
    endboot=$((2048+${bootsize}-1))
    startroot=$((2048+${bootsize}))
    endroot=$((2048+${bootsize}+${rootsize}-1))
    sed 's/ *#.*//' <<EOF | fdisk '%{install-root}/disk.img'
    o            # Switch to DOS
    n            # Create
    p            #    primary
    1            #    partition 1
    ${startboot} #    start sector
    ${endboot}   #    end sector
    n            # Create
    p            #    primary
    2            #    partition 2
    ${startroot} #    start sector
    ${endroot}   #    end sector
    t            # Change type
    1            #    partition 1
    6            #    FAT16
    t            # Change type
    2            #    partition 2
    83           #    Linux
    a            # Toggle bootable
    1            #    partition 1
    p            # Print for log
    w            # Write changes
    EOF
    dd if=/tmp/boot.img of='%{install-root}/disk.img' bs=512 seek="${startboot}" conv=notrunc
    dd if=/tmp/root.img of='%{install-root}/disk.img' bs=512 seek="${startroot}" conv=notrunc

  - |
    dd if=/usr/share/syslinux/mbr.bin of='%{install-root}/disk.img' bs=440 count=1 conv=notrunc
