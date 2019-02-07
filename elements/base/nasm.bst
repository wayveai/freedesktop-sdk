kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

  install-commands:
  - |
    cd "%{builddir}"
    make -j1 INSTALLROOT="%{install-root}" install

sources:
- kind: tar
  url: https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.xz
  ref: 812ecfb0dcbc5bd409aaa8f61c7de94c5b8752a7b00c632883d15b2ed6452573
- kind: patch
  path: patches/nasm/nasm-disable-werror-attributes.patch
