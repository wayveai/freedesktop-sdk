kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/swig.bst

depends:
- components/glib.bst
- components/cryptsetup.bst
- components/gpgme.bst
- components/nss.bst
- components/python3.bst

variables:
  conf-local: >-
    --without-python
    --with-python3

sources:
- kind: git_tag
  url: pagure:volume_key.git
  track: master
  ref: volume_key-0.3.12-0-gf56614199726ba1897d8687f0927535693b6603f
