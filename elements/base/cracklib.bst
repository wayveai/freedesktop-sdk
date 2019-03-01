kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/intltool.bst
  type: build
- filename: base/python3.bst
  type: build
- filename: base/curl.bst
  type: build

variables:
  conf-local: --with-python PYTHON=/usr/bin/python3 am_cv_python_version=3.7m

config:
  configure-commands:
  - |
    cd src
    autopoint -f
    cd m4
    echo EXTRA_DIST = *.m4 > Makefile.am
    cd ..
    autoreconf -f -v -i

  - |
    mkdir build
    cd build
    ../src/%{configure}

  build-commands:
  - |
    cd build
    %{make}

  install-commands:
  - |
    cd build
    %{make-install}

  - |
    %{delete_libtool_files}

public:
  bst:
    integration-commands:
    - |
      rm -f "%{datadir}/cracklib/pw_dict"{,.pwd,.pwi}
      "%{sbindir}/create-cracklib-dict" -o "%{datadir}/cracklib/pw_dict" "%{datadir}/cracklib/cracklib-small"

    split-rules:
      devel:
        (>):
        - '%{libdir}/libcrack.so'

sources:
- kind: git_tag
  url: github:cracklib/cracklib.git
  track: master
  ref: v2.9.6-0-g1dd5ca2114c0dd478b17e68e38d2c9f7094552cc
