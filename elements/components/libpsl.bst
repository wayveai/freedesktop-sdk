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
  ref: libpsl-0.21.0-0-g1eaf1803591d6327987029621e121cade7193720
  submodules:
    list:
      checkout: true
      url: github:publicsuffix/list.git
- kind: patch
  path: patches/libpsl/libpsl-Use-the-detected-PYTHON-version.patch
