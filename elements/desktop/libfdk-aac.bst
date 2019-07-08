kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  conf-link-args: >-
    --disable-shared
    --enable-static
    --with-pic
    CFLAGS="${CFLAGS} -fvisibility=hidden"
    CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

sources:
- kind: git_tag
  url: git://people.freedesktop.org/~wtay/fdk-aac
  track: stripped4
  ref: 0fc0e0e0b89de3becd5f099eae725f13eeecc0d1
