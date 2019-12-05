kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libxml2.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libxslt.so'
        - '%{libdir}/libexslt.so'
  cpe:
    patches:
    - CVE-2019-11068
    - CVE-2019-13117
    - CVE-2019-13118

sources:
- kind: git_tag
  url: gnome:libxslt.git
  track: master
  ref: v1.1.33-0-gf1eb717f04d9cc297cc5e58e94b81ac96f47e741
- kind: patch
  path: patches/libxslt/CVE-2019-11068.patch
- kind: patch
  path: patches/libxslt/CVE-2019-13117.patch
- kind: patch
  path: patches/libxslt/CVE-2019-13118.patch
