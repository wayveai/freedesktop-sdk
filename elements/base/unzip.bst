kind: manual

depends:
  - filename: bootstrap-import.bst

variables:
  target: "linux_noasm"
  (?):
    - target_arch == "i686":
        target: "linux_asm"

config:
  configure-commands:
    - |
      rm -rf bzip2

    - |
      sh ./unix/configure

  build-commands:
    - |
      make -f unix/Makefile D_USE_BZ2="-DUSE_BZIP2" L_BZ2="-lbz2" %{target}

  install-commands:
    - |
      install -m 755 -D -t "%{install-root}%{bindir}" unzip funzip unzipsfx
      install -m 644 -D -t "%{install-root}%{datadir}/man/man1" man/funzip.1 man/unzip.1 man/unzipsfx.1 man/zipgrep.1 man/zipinfo.1

sources:
  - kind: tar
    url: https://downloads.sourceforge.net/infozip/unzip60.tar.gz
    ref: 036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37
