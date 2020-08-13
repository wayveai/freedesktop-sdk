kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- components/python3.bst
- public-stacks/buildsystem-autotools.bst

variables:
  conf-local: >-
    --with-python=%{bindir}/python3
    CPPFLAGS="$(pkg-config --cflags-only-I python3)"

config:
  install-commands:
    (>):
    - |
      %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/xml2-config'
        - '%{libdir}/libxml2.so'
        - '%{libdir}/xml2Conf.sh'
  cpe:
    patches:
      - CVE-2019-7595
      - CVE-2019-20388


sources:
- kind: git_tag
  url: gnome:libxml2.git
  track: master
  ref: v2.9.10-0-g41a34e1f4ffae2ce401600dbb5fe43f8fe402641
- kind: patch
  path: patches/libxml2/libxml2-python-in-nodeWrap-deal-with-name-is-None-case.patch
- kind: patch
  path: patches/libxml2/libxml2-python3-unicode-errors.patch
- kind: patch
  path: patches/libxml2/CVE-2019-20388.patch
- kind: patch
  path: patches/libxml2/CVE-2019-7595.patch
