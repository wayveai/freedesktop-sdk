kind: autotools

build-depends:
- filename: components/python3.bst
- filename: public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/cracklib.bst
- components/gzip.bst
- components/linux-pam-base.bst

variables:
  builddir: ''
  conf-local: --with-python-binary=python3 --with-securedir=%{libdir}/security

sources:
- kind: git_tag
  url: github:libpwquality/libpwquality.git
  track: master
  ref: libpwquality-1.4.3-0-g6b5f74a402136b0a32e4a6cf3394b7ddcf72ba53
