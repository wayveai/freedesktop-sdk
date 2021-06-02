kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpopt.so'

sources:
- kind: git_tag
  url: github:rpm-software-management/popt.git
  track: master
  ref: popt-1.18-release-0-g7e6478831e93fda9419ef576f9819f49ba06f972
