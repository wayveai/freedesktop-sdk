kind: make

build-depends:
- bootstrap-import.bst

(@):
- elements/extensions/mesa/config.yml

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
  make: make %{make-args}
  make-install: make -C lib -j1 install-pc install-static install-includes DESTDIR="%{install-root}" %{make-args}

sources:
- kind: git_tag
  url: github:facebook/zstd.git
  track: release
  ref: v1.5.0-0-ga488ba114ec17ea1054b9057c26a046fc122b3b6
