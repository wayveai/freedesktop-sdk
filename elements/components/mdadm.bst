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
  ref: mdadm-4.1-0-g20e8fe52e7190b3ffda127566852eac2eb7fa1f7
- kind: local
  path: files/mdadm
  directory: extra
