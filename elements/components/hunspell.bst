kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --with-readline \
    --with-ui

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhunspell-1.7.so'
  cpe:
    patches:
    - CVE-2019-16707

sources:
- kind: git_tag
  url: github:hunspell/hunspell.git
  track: master
  ref: v1.7.0-0-g4ddd8ed5ca6484b930b111aec50c2750a6119a0f
- kind: patch
  path: patches/hunspell/invalid-read-memory-access-624.patch
