kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  autogen: autoreconf -vif

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libwavpack.so'
  cpe:
    patches:
    - CVE-2021-44269

sources:
- kind: git_tag
  url: github:dbry/WavPack.git
  track: master
  ref: 5.4.0-0-g2ce3c069be548e82ea9c05741ace6583e549c6de
- kind: patch
  path: patches/wavpack/issue-110-sanitize-DSD-file-types-for-invalid-length.patch
