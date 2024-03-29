kind: script
description: |
  Prototype bootable image for QEMU with u-boot.

build-depends:
- components/linux.bst
- vm/minimal/initial-scripts.bst
- vm/prepare-image.bst
- vm/deploy-tools.bst
- vm/minimal/filesystem.bst
- vm/boot/u-boot.bst
- vm/minimal/qemu-firmware.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  uuid-boot: 10bf4857-5261-46d4-a178-cca1a9b5b997
  (?):
    - target_arch == "x86_64":
        linux-root: 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
    - target_arch == "i686":
        linux-root: 44479540-F297-41B2-9AF7-D131D5F0458A
    - target_arch == "arm":
        linux-root: 69DAD710-2CE4-4E3C-B16C-21A1D49ABED3
    - target_arch == "aarch64":
        linux-root: B921B045-1DF0-41C3-AF44-4C6F280D3FAE
    - target_arch == "riscv64":
        linux-root: 72EC70A6-CF74-40e6-BD49-4BDA08E8F224

config:
  layout:
  - element: ''
    destination: '/genimage'
  - element: ''
    destination: '/tmp'
  - element: 'components/linux.bst'
    destination: '/'
  - element: 'vm/deploy-tools.bst'
    destination: '/'
  - element: 'vm/minimal/filesystem.bst'
    destination: '/sysroot'
  - element: 'vm/boot/u-boot.bst'
    destination: '/sysroot/boot'
  - element: 'vm/minimal/initial-scripts.bst'
    destination: '/'
  - element: 'vm/minimal/qemu-firmware.bst'
    destination: '/firmware'

  commands:
  - |
    prepare-image.sh \
       --sysroot /sysroot \
       --seed "%{uuidnamespace}" \
       --efipath "/boot" \
       --efisource "UUID=%{uuid-boot}" \
       --efifstype "ext4" \
       --efifsopts "relatime" \
       --rootpasswd "root" >/tmp/vars

  - |
    . /tmp/vars
    mkdir -p /sysroot/boot/extlinux
    cat <<EOF >/sysroot/boot/extlinux/extlinux.conf
    default FreedesktopSDK
    menu title Boot Options.
    prompt 0
    timeout 50

    label FreedesktopSDK
        menu label Freedesktop SDK
        linux /vmlinuz
        initrd /initramfs.img
        append root=UUID=${uuid_root} rw console=tty0 console=ttyS0 quiet
    EOF

  - |
    . /tmp/vars
    cat >/genimage/genimage.cfg <<EOF
    image boot.img {
        ext4  {
            label = "boot"
            extraargs = "-U %{uuid-boot}"
            use-mke2fs = true
        }
        mountpoint = "/boot"
        size = 500M
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
            gpt = true
        }
        partition boot {
            image = "boot.img"
            partition-type-uuid = "bc13c2ff-59e6-4262-a352-b275fd6f7172"
        }
        partition root {
            image = "root.img"
            partition-type-uuid = "%{linux-root}"
        }
    }
    EOF

  - |
    cd /genimage/
    genimage --rootpath /sysroot

  - |
    install -Dm644 -t "%{install-root}" /genimage/images/disk.img

  - |
    install -Dm644 -t "%{install-root}" /firmware/*
