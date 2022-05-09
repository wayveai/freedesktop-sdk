kind: make

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst

depends:
- components/open-isns.bst
- components/kmod.bst
- components/systemd-libs.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    exec_prefix="%{prefix}"
    sbindir="%{sbindir}"
    bindir="%{bindir}"
    mandir="%{mandir}"
    etcdir="%{sysconfdir}"
    LIB_DIR="%{libdir}"

  make: make %{make-args}
  make-install: make %{make-args} -j1 install install_systemd install_udev_rules DESTDIR="%{install-root}"

sources:
- kind: git_tag
  url: github:open-iscsi/open-iscsi.git
  track: master
  ref: 2.1.7-0-g7b53fcc502da8617110fd64d675b476772c28a6f
- kind: patch
  path: patches/open-iscsi/no-werror.patch
