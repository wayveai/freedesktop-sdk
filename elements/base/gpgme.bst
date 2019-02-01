kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/libgpg-error.bst
- filename: base/libassuan.bst
- filename: base/gnupg.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/git.bst
  type: build
- filename: base/texinfo.bst
  type: build

variables:
  conf-local: |
    --enable-maintainer-mode \
    --disable-glibtest     \
    --disable-gpgconf-test \
    --disable-gpg-test     \
    --disable-gpgsm-test   \
    --disable-g13-test

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgpgme.so'
        - '%{libdir}/libgpgmepp.so'

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

sources:
- kind: git_tag
  url: gnupg:gpgme.git
  track: master
  ref: gpgme-1.11.1-0-g2e9a14912fb906c17017553ccd0941d172e095ff
