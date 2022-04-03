kind: manual

build-depends:
- components/linux.bst
- components/sign-file.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}/usr/lib"
    cp -rT /usr/lib/modules "%{install-root}/usr/lib/modules"

  - |
    mkdir -p "%{install-root}/boot"
    cp -rT /boot "%{install-root}/boot"

  - |
    find '%{install-root}/usr/lib/modules' -type f -name "*.ko" -print -exec sign-file sha256 VENDOR.key VENDOR.cer {} '%{install-root}{}' ';'

sources:
- kind: local
  path: files/boot-keys/VENDOR.key
- kind: local
  path: files/boot-keys/VENDOR.cer
