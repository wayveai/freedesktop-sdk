kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpng.so'
        - '%{libdir}/libpng16.so'
  cpe:
    patches:
    - CVE-2019-7317

sources:
- kind: git_tag
  url: github:glennrp/libpng
  track: libpng16
  ref: v1.6.36-0-geddf9023206dc40974c26f589ee2ad63a4227a1e
- kind: patch
  path: patches/libpng/cve-2019-7317.patch
- kind: patch
  path: patches/libpng/libpng-1.6.36-apng.patch
