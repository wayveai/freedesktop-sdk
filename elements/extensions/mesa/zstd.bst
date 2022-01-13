kind: make

build-depends:
- bootstrap-import.bst

(@):
- elements/extensions/mesa/config.yml
- elements/include/zstd-source.yml

variables:
  make-args: >-
    PREFIX="%{prefix}"
    LIBDIR="%{libdir}"
  make: make %{make-args}
  make-install: make -C lib -j1 install-pc install-static install-includes DESTDIR="%{install-root}" %{make-args}

