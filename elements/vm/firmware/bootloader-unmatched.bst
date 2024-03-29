kind: script

build-depends:
- vm/deploy-tools.bst
- components/u-boot-unmatched.bst
- components/linux.bst

variables:
  sysroot: "/sysroot"

config:
  layout:
  - element: ''
    destination: '/sysroot'
  - element: vm/deploy-tools.bst
    destination: '/'
  - element: components/u-boot-unmatched.bst
    destination: '/'
  - element: components/linux.bst
    destination: '/'

  commands:
  - mkdir -p "%{sysroot}/boot/dtb"

  - |
    cp "/boot/dtbs/sifive/hifive-unmatched-a00.dtb" "%{sysroot}/boot/dtb/hifive-unmatched-a00.dtb"

  - mkdir -p '%{install-root}/input'
  - cp /usr/share/u-boot/sifive_hifive_unmatched_fu740/u-boot-spl.bin '%{install-root}/input'
  - cp /usr/share/u-boot/sifive_hifive_unmatched_fu740/u-boot.itb '%{install-root}/input'

  - |
    cat > %{install-root}/genimage.cfg <<EOF
    image dtb.img {
        vfat {
            extraargs = "-F32"
        }
        mountpoint = "/boot"
        size = 10M
    }
    image disk.img {
        hdimage {
            gpt = true
        }
        partition u-boot-spl {
            image = "u-boot-spl.bin"
            partition-type-uuid = "5b193300-fc78-40cd-8002-e86c45580b47"
            size = "1M"
            offset = "17K"
        }
        partition u-boot-itb {
            image = "u-boot.itb"
            partition-type-uuid = "2e54b353-1271-4842-806f-e436d6af6985"
            size = "4M"
            offset = "1041K"
        }
        partition dtb {
            image = dtb.img"
        }
    }
    EOF

  - |
    cd %{install-root}
    genimage --rootpath "%{sysroot}"
    mv images/disk.img .
    rm -rf genimage.cfg images/ tmp/

  - rm -r '%{install-root}/input'
