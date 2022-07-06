kind: manual

depends:
- bootstrap-import.bst

build-depends:
- components/python3.bst

config:
  build-commands:
  - python3 compress.py

  install-commands:
  - make DESTDIR="%{install-root}" FIRMWAREDIR="%{indep-libdir}/firmware" install

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: main
  ref: 20220610-0-g7b71b75be8fb0fa7cceeb3dc22f97920a6be28bd
- kind: patch
  path: patches/linux-firmware/fix-WHENCE.patch
- kind: local
  path: files/linux-firmware/compress.py
