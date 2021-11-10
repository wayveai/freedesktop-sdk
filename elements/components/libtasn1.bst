kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/git-minimal.bst
- components/help2man.bst
- components/texinfo.bst
- components/patch.bst
- components/gtk-doc.bst

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
  ref: v4.18.0-0-geacec5d46cbadc08280081830e42396d2d690b1d
  submodules:
    gnulib:
      checkout: true
      url: savannah:gnulib.git
