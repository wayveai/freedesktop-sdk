kind: script

build-depends:
- vm/deploy-tools.bst
- vm/boot/efi.bst
- vm/minimal/filesystem.bst
- vm/minimal/initial-scripts.bst
- vm/prepare-image.bst


variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  (?):
    # fdisk GUID mapping
    - target_arch == "x86_64":
        linux-root: '24' # 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
    - target_arch == "i686":
        linux-root: '22' # 44479540-F297-41B2-9AF7-D131D5F0458A
    - target_arch == "arm":
        linux-root: '23' # 69DAD710-2CE4-4E3C-B16C-21A1D49ABED3
    - target_arch == "aarch64":
        linux-root: '25' # B921B045-1DF0-41C3-AF44-4C6F280D3FAE

config:
  layout:
  - element: ''
    destination: '/efi'
  - element: ''
    destination: '/tmp'
  - element: 'vm/deploy-tools.bst'
    destination: '/'
  - element: 'vm/boot/efi.bst'
    destination: '/efi'
  - element: 'vm/minimal/filesystem.bst'
    destination: '/sysroot'
  - element: 'vm/minimal/initial-scripts.bst'
    destination: '/'

  commands:
  - prepare-image.sh --sysroot /sysroot --seed "%{uuidnamespace}" >/tmp/vars

  - truncate -s 100M /tmp/efi.img
  - |
    . /tmp/vars
    mkfs.fat -F32 -i "${id_efi}" -n EFI /tmp/efi.img
  - mcopy -s -i /tmp/efi.img /efi/* ::/

  - truncate -s 1G /tmp/root.img
  - |
    . /tmp/vars
    mkfs.ext4 -L root -d /sysroot -U ${uuid_root} /tmp/root.img

  - |
    efisize=$(($(stat -c "%s" /tmp/efi.img)/512))
    rootsize=$(($(stat -c "%s" /tmp/root.img)/512))
    truncate -s $(((2048+${efisize}+${rootsize}+34)*512)) '%{install-root}/disk.img'
    startefi=2048
    endefi=$((2048+${efisize}-1))
    startroot=$((2048+${efisize}))
    endroot=$((2048+${efisize}+${rootsize}-1))
    sed 's/ *#.*//' <<EOF | fdisk '%{install-root}/disk.img'
    g            # Switch to GPT
    n            # Create
    1            #    partition 1
    ${startefi}  #    start sector
    ${endefi}    #    end sector
    n            # Create
    2            #    partition 2
    ${startroot} #    start sector
    ${endroot}   #    end sector
    t            # Change type
    1            #    partition 1
    1            #    EFI system C12A7328-F81F-11D2-BA4B-00A0C93EC93B
    t            # Change type
    2            #    partition 2
    %{linux-root}#    Linux root (x86-64) 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
    p            # Print for log
    w            # Write changes
    EOF
    dd if=/tmp/efi.img of='%{install-root}/disk.img' bs=512 seek="${startefi}" conv=notrunc
    dd if=/tmp/root.img of='%{install-root}/disk.img' bs=512 seek="${startroot}" conv=notrunc
