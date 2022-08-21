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
  ref: 20220815-0-g8413c63c7a539a912be8851ce941eea32dcd1786
- kind: local
  path: files/linux-firmware/compress.py
