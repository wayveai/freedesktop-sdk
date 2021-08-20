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
    --disable-ssh-token
    --with-tmpfilesdir="%{indep-libdir}/tmpfiles.d"

sources:
- kind: git_tag
  url: gitlab:cryptsetup/cryptsetup.git
  track: master
  exclude:
  - '*rc*'
  ref: v2.4.0-0-g0f8e7f317f9b2daa4c4f8ef10e2dae8fcac9479b
