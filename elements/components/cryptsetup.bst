kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/json-c.bst
- components/lvm2.bst
- components/pwquality.bst
- components/util-linux.bst

variables:
  conf-local: >-
    --enable-pwquality
    --with-tmpfilesdir="%{indep-libdir}/tmpfiles.d"

sources:
- kind: git_tag
  url: gitlab:cryptsetup/cryptsetup.git
  track: master
  ref: v2.3.3-0-g74e94e7bdd12fdfd4e5869d14c91cee2fe242eeb
