kind: myautotools

depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: base/python2.bst
    type: build
  - filename: base/python3.bst
    type: build

variables:
  conf-local:
    --without-python

config:
  configure-commands:
    (>):
      - |
        mkdir build_python2
        cd build_python2
        ../%{configure} --with-python PYTHON=/usr/bin/python2

      # Include path is not correctly detected and uses version
      # number. We need to force version to 3.6m for the headers to be
      # found.
      - |
        mkdir build_python3
        cd build_python3
        ../%{configure} --with-python PYTHON=/usr/bin/python3 am_cv_python_version=3.6m

  build-commands:
    (>):
      - |
        cd build_python2/python
        %{make} top_builddir="../../%{builddir}"

      - |
        cd build_python3/python
        %{make} top_builddir="../../%{builddir}"

  install-commands:
    (>):
      - |
        cd build_python2/python
        %{make-install} top_builddir="../../%{builddir}"

      - |
        cd build_python3/python
        %{make-install} top_builddir="../../%{builddir}"


public:
  bst:
    integration-commands:
      - |
        "%{sbindir}/create-cracklib-dict" -o "%{datadir}/cracklib/pw_dict" "%{datadir}/cracklib/cracklib-small"

    split-rules:
      devel:
        (>):
          - "%{libdir}/libcrack.so"

sources:
  - kind: tar
    url: https://github.com/cracklib/cracklib/releases/download/cracklib-2.9.6/cracklib-2.9.6.tar.gz
    ref: 17cf76943de272fd579ed831a1fd85339b393f8d00bf9e0d17c91e972f583343
