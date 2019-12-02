kind: make

depends:
- filename:  bootstrap-import.bst

variables:
  install-commands: make -j1 prefix="%{install-root}" includedir="%{install-root}/%{includedir}" libdir="%{install-root}%{libdir}" install

config:
  install-commands:
  - |
    %{install-commands}

sources:
- kind: tar
  url: https://releases.pagure.org/libaio/libaio-0.3.111.tar.gz
  ref: 62cf871ad8fd09eb3418f00aca7a7d449299b8e1de31c65f28bf6a2ef1fa502a
