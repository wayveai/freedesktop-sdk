kind: manual

depends:
- filename: bootstrap-import.bst

config:
  build-commands:
  - |
    make

  install-commands:
  - |
    make -j1 DESTDIR="%{install-root}" install

# We're really only interested in the timezone data
  - |
    rm -rf "%{install-root}%{bindir}"
  - |
    rm -rf "%{install-root}/etc"
  - |
    rm -rf "%{install-root}%{indep-libdir}"
  - |
    rm -rf "%{install-root}%{prefix}/sbin"

# Man pages are provided by Linux's man-pages
# sdk/elements/base/man-pages.bst
  - |
    rm -rf "%{install-root}%{mandir}"

# Set up a default timezone, for when Flatpak can't use the host one
  - |
    mkdir -p "%{install-root}%{sysconfdir}"
  - |
    ln -sf "%{datadir}/zoneinfo/UTC" "%{install-root}%{sysconfdir}/localtime"

sources:
- kind: tar
  url: https://data.iana.org/time-zones/releases/tzdata2018e.tar.gz
  ref: 6b288e5926841a4cb490909fe822d85c36ae75538ad69baf20da9628b63b692e
  base-dir: ''
- kind: tar
  url: https://data.iana.org/time-zones/releases/tzcode2018e.tar.gz
  ref: ca340cf20e80b699d6e5c49b4ba47361b3aa681f06f38a0c88a8e8308c00ebce
  base-dir: ''
