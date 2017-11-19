kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python2.bst
  - filename: base/python3.bst

variables:
  conf-extra: |
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
    url: ftp://xmlsoft.org/libxml2/libxml2-2.9.6.tar.gz
    ref: 8b9038cca7240e881d462ea391882092dfdc6d4f483f72683e817be08df5ebbc
