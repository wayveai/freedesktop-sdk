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

variables:
  builddir: ''

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

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
  ref: libtasn1_4_14-0-g56fc4f8cb8136aa4b18527af47e1eb4858e74af1
  submodules:
    gnulib:
      checkout: true
      url: savannah:gnulib.git
- kind: patch
  path: patches/libtasn1/ldflags.patch
