kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfdk-aac.so'

sources:
- kind: git_tag
  url: git://people.freedesktop.org/~wtay/fdk-aac
  track: stripped2
  ref: ba7ffc9dd95b73b2b5f465f127609aa4235f6800
