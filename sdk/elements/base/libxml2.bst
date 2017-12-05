kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python2.bst
  - filename: base/python3.bst

variables:
  conf-local: |
    --without-python

config:
  configure-commands:
    (>):
    - |
      mkdir build-python2
      cd build-python2
      ../%{configure} --with-python=%{bindir}/python2
    - |
      mkdir build-python3
      cd build-python3
      ../%{configure} --with-python=%{bindir}/python3

  build-commands:
    (>):
    - |
      cd build-python2/python
      %{make} top_builddir=../../%{builddir}

    - |
      cd build-python3/python
      %{make} top_builddir=../../%{builddir}

  install-commands:
    (>):
    - |
      cd build-python2/python
      %{make-install} top_builddir=../../%{builddir}

    - |
      cd build-python3/python
      %{make-install} top_builddir=../../%{builddir}

public:
  bst:
    split-rules:
      devel:
        (>):
          - "%{libdir}/libxml2.so"

sources:
  - kind: tar
    url: ftp://xmlsoft.org/libxml2/libxml2-2.9.7.tar.gz
    ref: f63c5e7d30362ed28b38bfa1ac6313f9a80230720b7fb6c80575eeab3ff5900c
  - kind: patch
    path: elements/base/libxml2-python3.patch
