kind: make

build-depends:
- components/git-minimal.bst
- components/pkg-config.bst
- components/systemd.bst

depends:
- bootstrap-import.bst

variables:
  make-args: >-
    BINDIR="%{bindir}"
    MANDIR="%{mandir}"
    SYSTEMD_DIR="$(pkg-config --variable=systemd_system_unit_dir systemd)"
    CWFLAGS=""
    CHECK_RUN_DIR=0

  make: make %{make-args}
  make-install: make -j1 %{make-args} DESTDIR="%{install-root}" install install-systemd

config:
  install-commands:
    (>):
    - |
      tmpfilesdir="$(pkg-config --variable tmpfilesdir systemd)"
      install -Dm644 -t  "%{install-root}${tmpfilesdir}" extra/mdadm.conf

sources:
- kind: git_tag
  url: kernel:utils/mdadm/mdadm.git
  track: master
  ref: mdadm-4.2-0-ge30ca260741d727e6f444e8f2ce25fe7a5a26567
- kind: local
  path: files/mdadm
  directory: extra
