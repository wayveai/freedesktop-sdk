kind: manual

build-depends:
- vm/boot/efi-secure.bst
- components/sbsigntools.bst
- components/sign-file.bst

variables:
  (?):
  - target_arch == 'i686':
      efi-arch: ia32
  - target_arch == 'x86_64':
      efi-arch: x64
  - target_arch == 'aarch64':
      efi-arch: aa64
  - target_arch == 'riscv64':
      efi-arch: riscv64

config:
  install-commands:
  - |
    cp -rT /boot "%{install-root}/boot"

  - |
    mkdir -p "%{install-root}/usr/lib"
    cp -rT /usr/lib/modules "%{install-root}/usr/lib/modules"

  - |
    version="$(ls -1 /usr/lib/modules | head -n1)"
    sbsign --key VENDOR.key --cert VENDOR.crt --output "%{install-root}/boot/EFI/Linux/linux-${version}.efi" "/boot/EFI/Linux/linux-${version}.efi"

  - |
    sbsign --key VENDOR.key --cert VENDOR.crt --output "%{install-root}/boot/EFI/systemd/systemd-boot%{efi-arch}.efi" "/boot/EFI/systemd/systemd-boot%{efi-arch}.efi"

  - |
    sbsign --key DB.key --cert DB.crt --output "%{install-root}/boot/EFI/freedesktopsdk/shim%{efi-arch}.efi" "/boot/EFI/freedesktopsdk/shim%{efi-arch}.efi"
    sbsign --key DB.key --cert DB.crt --output "%{install-root}/boot/EFI/freedesktopsdk/mm%{efi-arch}.efi" "/boot/EFI/freedesktopsdk/mm%{efi-arch}.efi"
    sbsign --key DB.key --cert DB.crt --output "%{install-root}/boot/EFI/BOOT/fb%{efi-arch}.efi" "/boot/EFI/BOOT/fb%{efi-arch}.efi"
    cp "%{install-root}/boot/EFI/freedesktopsdk/mm%{efi-arch}.efi" "%{install-root}/boot/EFI/BOOT/mm%{efi-arch}.efi"
    cp "%{install-root}/boot/EFI/freedesktopsdk/shim%{efi-arch}.efi" "%{install-root}/boot/EFI/BOOT/BOOT$(echo "%{efi-arch}" | tr a-z A-Z).EFI"

sources:
- kind: local
  path: files/boot-keys/VENDOR.key
- kind: local
  path: files/boot-keys/VENDOR.crt
- kind: local
  path: files/boot-keys/DB.key
- kind: local
  path: files/boot-keys/DB.crt
