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
  ref: 2.1.6-0-gee575fd19429ec6dc24b49f2ce3822b4a01f57de
- kind: patch
  path: patches/open-iscsi/no-werror.patch
