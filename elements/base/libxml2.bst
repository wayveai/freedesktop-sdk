kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/xz.bst
- filename: base/python3.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --with-python=%{bindir}/python3

config:
  install-commands:
    (>):
    - |
      %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxml2.so'

sources:
- kind: git_tag
  url: gnome:libxml2.git
  track: master
  ref: v2.9.9-0-gf8a8c1f59db355b46962577e7b74f1a1e8149dc6
- kind: patch
  path: patches/libxml2/libxml2-python-in-nodeWrap-deal-with-name-is-None-case.patch
- kind: patch
  path: patches/libxml2/libxml2-python3-unicode-errors.patch
