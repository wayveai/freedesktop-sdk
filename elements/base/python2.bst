kind: autotools
description: Python 2

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/expat.bst
- filename: base/libffi.bst
- filename: base/gdbm.bst
- filename: base/openssl.bst
- filename: base/sqlite.bst
- filename: base/xz.bst

variables:
  conf-local: |
    --enable-shared \
    --with-ensurepip=yes \
    --with-system-expat \
    --with-system-ffi \
    --enable-loadable-sqlite-extensions \
    --with-dbmliborder=gdbm \
    --enable-unicode=ucs4

public:
  bst:
    split-rules:
      devel:
        (>):
        - '**'
  cpe:
    product: python
    patches:
    - CVE-2019-9948
    - CVE-2018-20852
    - CVE-2019-16056
    - CVE-2019-9636
    - CVE-2019-9740
    - CVE-2019-9947 # Same fix as CVE-2019-9740

config:
  install-commands:
  - |
    if [ -n "%{builddir}" ]; then
      cd %{builddir}
    fi
    %{make-install} DESTSHARED=/usr/lib/python2.7/lib-dynload

  - |
    rm -f "%{install-root}%{bindir}/2to3"
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/lib2to3
  - |
    rm -rf %{install-root}%{bindir}/idle*
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/idlelib
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/lib-tk
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/test
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/*/test
  - |
    rm -rf %{install-root}%{indep-libdir}/python2.7/*/tests

  - |
    find "%{install-root}" -name "lib*.a" -exec rm {} ";"

  - |
    %{fix-pyc-timestamps}

sources:
- kind: tar
  url: tar_https:www.python.org/ftp/python/2.7.16/Python-2.7.16.tar.xz
  ref: f222ef602647eecb6853681156d32de4450a2c39f4de93bd5b20235f2e660ed7
- kind: patch
  path: patches/python2/bpo-35907-CVE-2019-9948-urllib-rejects-local_file-sc.patch
- kind: patch
  path: patches/python2/bpo-35907-Complete-test_urllib.test_local_file_open-.patch
- kind: patch
  path: patches/python2/bpo-35121-prefix-dot-in-domain-for-proper-subdom.patch
- kind: patch
  path: patches/python2/bpo-34155-Dont-parse-domains-containing-GH-13079.patch
- kind: patch
  path: patches/python2/bpo-36216-Add-check-for-characters-in-netloc-that-no.patch
- kind: patch
  path: patches/python2/bpo-36216-Only-print-test-messages-when-verbose-.patch
- kind: patch
  path: patches/python2/bpo-36742-Fixes-handling-of-pre-normalization-charac.patch
- kind: patch
  path: patches/python2/bpo-36742-Corrects-fix-to-handle-decomposition-in-us.patch
- kind: patch
  path: patches/python2/bpo-36742-Fix-urlparse.urlsplit-error-message-fo.patch
- kind: patch
  path: patches/python2/bpo-30458-Disallow-control-chars-in-http-URLs-GH-127.patch
