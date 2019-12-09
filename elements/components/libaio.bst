kind: make

depends:
- filename: bootstrap-import.bst

variables:
  install-commands: make -j1 prefix="%{install-root}" includedir="%{install-root}/%{includedir}" libdir="%{install-root}%{libdir}" install

config:
  install-commands:
  - |
    %{install-commands}

sources:
- kind: tar
  url: pagure_releases:libaio/libaio-0.3.112.tar.gz
  ref: ab0462f2c9d546683e5147b1ce9c195fe95d07fac5bf362f6c01637955c3b492
