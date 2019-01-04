kind: manual

depends:
- filename: bootstrap-import.bst

variables:
  target: linux_noasm
  (?):
  - target_arch == "i686":
      target: linux_asm

config:
  configure-commands:
  - |
    rm -rf bzip2

  - |
    sh ./unix/configure

  build-commands:
  - |
    make -f unix/Makefile LOCAL_UNZIP="${CFLAGS}" LFLAGS1="${LDFLAGS}" D_USE_BZ2="-DUSE_BZIP2" L_BZ2="-lbz2" %{target}

  install-commands:
  - |
    make -f unix/Makefile BINDIR="%{install-root}%{bindir}" MANDIR="%{install-root}%{datadir}/man/man1" install

  - |
    rm "%{install-root}%{bindir}/zipinfo"
    ln -s unzip "%{install-root}%{bindir}/zipinfo"

public:
  cpe:
    vendor: 'info-zip'
    version: '6.0'
    patches:
      - CVE-2014-9636
      - CVE-2014-9913
      - CVE-2015-7696
      - CVE-2015-7697
      - CVE-2016-9844
      - CVE-2018-18384

sources:
- kind: tar
  url: https://downloads.sourceforge.net/infozip/unzip60.tar.gz
  ref: 036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37
- kind: patch
  path: patches/unzip/CVE-2014-9636.patch
- kind: patch
  path: patches/unzip/CVE-2014-9913.patch
- kind: patch
  path: patches/unzip/CVE-2015-7696.patch
- kind: patch
  path: patches/unzip/CVE-2015-7697.patch
- kind: patch
  path: patches/unzip/CVE-2016-9844.patch
- kind: patch
  path: patches/unzip/CVE-2018-18384.patch
