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
  url: tar_https:data.iana.org/time-zones/releases/tzdata2018i.tar.gz
  ref: 82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9
  base-dir: ''
- kind: tar
  url: tar_https:data.iana.org/time-zones/releases/tzcode2018i.tar.gz
  ref: aaacdb876ca6fb9d58e244b462cbc7578a496b1b10994381b4b32b9f2ded32dc
  base-dir: ''
