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
  ref: 20200316-0-g8eb0b281511d6455ca9151e52f694dc982193251
