kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/bison.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/help2man.bst
  type: build
- filename: components/texinfo.bst
  type: build
- filename: components/patch.bst
  type: build

variables:
  builddir: ''
  # When using --disable-static, some useless rpaths appear
  conf-link-args: >-
    --enable-shared

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"
    - rm "%{install-root}%{libdir}/libtasn1.a"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtasn1.so'

sources:
- kind: git_tag
  url: gitlab:gnutls/libtasn1.git
  track: master
  ref: v4.17.0-0-g6e8c03bc4a42f9783a91a8166e4443ba59ba5a97
  submodules:
    gnulib:
      checkout: true
      url: savannah:gnulib.git
