kind: manual

depends:
- filename: bootstrap-import.bst

config:
  install-commands:
  - |
    make DESTDIR="%{install-root}" FIRMWAREDIR="%{indep-libdir}/firmware" install

sources:
- kind: git_tag
  url: kernel:linux/kernel/git/firmware/linux-firmware.git
  track: master
  ref: 20210208-0-gb79d2396bc630bfd9b4058459d3e82d7c3428599
