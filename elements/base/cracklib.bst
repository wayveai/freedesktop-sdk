kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
  type: build

variables:
  conf-local: --with-python PYTHON=/usr/bin/python3 am_cv_python_version=3.7m

config:
  install-commands:
    (>):
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
- kind: tar
  url: https://github.com/cracklib/cracklib/releases/download/cracklib-2.9.6/cracklib-2.9.6.tar.gz
  ref: 17cf76943de272fd579ed831a1fd85339b393f8d00bf9e0d17c91e972f583343
