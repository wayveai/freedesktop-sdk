kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/linux-pam.bst
- filename: components/cracklib.bst
- filename: components/gzip.bst

variables:
  builddir: ''
  conf-local: --with-python-binary=python3 --with-securedir=%{libdir}/security

sources:
- kind: git_tag
  url: github:libpwquality/libpwquality.git
  track: master
  ref: libpwquality-1.4.0-0-gec03e45823965bbcfcbaec7497a1b47033c3b632
