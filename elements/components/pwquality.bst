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
  # Python package built as part of project does not support
  # build-dir
  build-dir: ''
  conf-local: >-
    --with-python-binary=python3
    --with-securedir=%{libdir}/security

sources:
- kind: git_tag
  url: github:libpwquality/libpwquality.git
  track: master
  ref: libpwquality-1.4.4-0-ge3e46f16c651e74bdb105a2b832b67795c57c0a2
