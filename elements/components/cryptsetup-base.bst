kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/json-c.bst
- components/pwquality.bst
- components/util-linux-full.bst
- components/lvm2-stage1.bst
- components/popt.bst
- components/openssl.bst

variables:
  conf-local: >-
    --enable-pwquality
    --with-tmpfilesdir="%{indep-libdir}/tmpfiles.d"

sources:
- kind: git_tag
  url: gitlab:cryptsetup/cryptsetup.git
  track: master
  exclude:
  - '*rc*'
  ref: v2.3.3-0-g74e94e7bdd12fdfd4e5869d14c91cee2fe242eeb
