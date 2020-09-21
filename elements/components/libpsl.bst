kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libidn2.bst
- filename: components/libunistring.bst
- filename: components/git-minimal.bst
  type: build
- filename: components/python3.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libpsl.so"

sources:
- kind: git_tag
  url: github:rockdaboot/libpsl.git
  track: master
  ref: 0.21.1-0-ga5e6f26cce82898c54a0caa6dda0ab924b806daf
- kind: git_module
  path: list
  url: github:publicsuffix/list.git
  ref: 826d762a078ae21cd8bb95fa8f38ae84bb3948e7
