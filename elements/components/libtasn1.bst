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

  cpe:
    version-match: 'libtasn1_(\d+)_(\d+)'

sources:
- kind: git_tag
  url: gitlab:gnutls/libtasn1.git
  track: master
  ref: libtasn1_4_16_0-0-g78204593822b4c1a8e0ca87f57c48e5936b0fe2c
  submodules:
    gnulib:
      checkout: true
      url: savannah:gnulib.git
