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
    destination: '/genimage'
  - element: ''
    destination: '/tmp'
  - element: 'vm/deploy-tools.bst'
    destination: '/'
  - element: 'vm/boot/bios.bst'
    destination: '/sysroot/boot'
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

  - |
    . /tmp/vars
    cat >/genimage/genimage.cfg <<EOF
    image boot.img {
        vfat {
            extraargs = "-F16 -i${id_efi} -n BOOT"
        }
        mountpoint = "/boot"
        size = 100M
    }
    image root.img {
        ext4  {
            label = "root"
            extraargs = "-U ${uuid_root}"
            use-mke2fs = true
        }
        size = 1G
    }
    image disk.img {
        hdimage {
            align = 1M
            gpt = false
        }
        partition boot {
            image = "boot.img"
            bootable = true
            partition-type = "0x6"
        }
        partition root {
            image = "root.img"
            partition-type = "0x83"
        }
    }
    EOF

  - |
    cd /genimage/
    genimage --rootpath /sysroot

  - |
    install -Dm644 -t "%{install-root}" /genimage/images/disk.img

  - syslinux --install '%{install-root}/disk.img' --directory /syslinux --offset 1048576

  - |
    dd if=/usr/share/syslinux/mbr.bin of='%{install-root}/disk.img' bs=440 count=1 conv=notrunc
