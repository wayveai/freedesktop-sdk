kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/libgpg-error.bst
- filename: components/libassuan.bst
- filename: components/gnupg.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/git-minimal.bst
  type: build
- filename: components/texinfo.bst
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
        - '%{bindir}/gpgme-config'
        - '%{libdir}/libgpgme.so'
        - '%{libdir}/libgpgmepp.so'

config:
  install-commands:
    (>):
    - rm "%{install-root}/usr/share/info/dir"

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}"
      mv "%{install-root}%{includedir}/gpgme.h" "%{install-root}%{includedir}/%{gcc_triplet}/"

sources:
- kind: git_tag
  url: gnupg:gpgme.git
  track: master
  exclude:
  - "*-base"
  ref: gpgme-1.15.1-0-gbb9880778fb16cdb6de83905e45bf6c965770013
