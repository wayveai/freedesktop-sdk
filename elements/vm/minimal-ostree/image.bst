kind: manual

build-depends:
- components/ostree.bst
- vm/deploy-tools.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  (?):
    # fdisk GUID mapping
  - target_arch == "x86_64":
      linux-root: '24'   # 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
  - target_arch == "i686":
      linux-root: '22'   # 44479540-F297-41B2-9AF7-D131D5F0458A
  - target_arch == "arm":
      linux-root: '23'   # 69DAD710-2CE4-4E3C-B16C-21A1D49ABED3
  - target_arch == "aarch64":
      linux-root: '25'   # B921B045-1DF0-41C3-AF44-4C6F280D3FAE

  (@):
  - ostree-config.yml

  sysroot: "%{build-root}/sysroot"

environment:
  OSTREE_REPO: "%{sysroot}/ostree/repo"

config:
  build-commands:
  - mkdir -p "${OSTREE_REPO}"
  - ostree init --repo="${OSTREE_REPO}" --mode=bare

  - ostree config --group sysroot set bootloader none
  - ostree pull-local "%{build-root}/source-repo" %{ostree-branch}

  - mkdir -p "%{sysroot}/boot"

  - ostree admin init-fs "%{sysroot}"
  - ostree admin os-init --sysroot="%{sysroot}" freedesktop-sdk
  - |
    ostree admin deploy --os="freedesktop-sdk" \
         --sysroot="%{sysroot}" %{ostree-branch} \
         --karg="rw" --karg=console=ttyS0

  - |
    mkdir -p "%{sysroot}/etc/ostree"
    cp -r "%{sysroot}"/ostree/boot.1/freedesktop-sdk/*/*/etc/ostree/remotes.d "%{sysroot}/etc/ostree/remotes.d"

  - |
    ostree admin set-origin --sysroot="%{sysroot}" \
           --index=0 \
           FreedesktopSDK dummy \
           %{ostree-branch}

  - |
    cp -r "%{sysroot}"/ostree/boot.1/freedesktop-sdk/*/*/boot/EFI/ "%{sysroot}/boot/"

  - mkdir -p "%{build-root}/temp-images"
  - truncate -s 100M "%{build-root}/temp-images/efi.img"
  - |
    mkfs.fat -F32 -n EFI "%{build-root}/temp-images/efi.img"
  - mcopy -s -i "%{build-root}/temp-images/efi.img" "%{sysroot}"/boot/* ::/

  - |
    rm -rf "%{sysroot}"/boot/*

  - truncate -s 1G "%{build-root}/temp-images/root.img"
  - |
    mkfs.ext4 -L root -d "%{sysroot}" "%{build-root}/temp-images/root.img"

  - |
    efisize=$(($(stat -c "%s" "%{build-root}/temp-images/efi.img")/512))
    rootsize=$(($(stat -c "%s" "%{build-root}/temp-images/root.img")/512))
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
    dd if="%{build-root}/temp-images/efi.img" \
       of='%{install-root}/disk.img' bs=512 \
       seek="${startefi}" conv=notrunc
    dd if="%{build-root}/temp-images/root.img" \
       of='%{install-root}/disk.img' bs=512 \
       seek="${startroot}" conv=notrunc

sources:
- kind: ostree_mirror
  gpg: files/vm/ostree-config/fdsdk.gpg
  path: ostree-repo
  match: 'freedesktop-sdk-*'
  directory: source-repo
