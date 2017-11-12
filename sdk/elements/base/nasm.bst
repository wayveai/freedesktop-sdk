kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build

config:
  install-commands:
    - |
      cd "%{builddir}"
      make -j1 INSTALLROOT="%{install-root}" install

sources:
  - kind: tar
    url: http://www.nasm.us/pub/nasm/releasebuilds/2.13.01/nasm-2.13.01.tar.xz
    ref: aa0213008f0433ecbe07bb628506a5c4be8079be20fc3532a5031fd639db9a5e
