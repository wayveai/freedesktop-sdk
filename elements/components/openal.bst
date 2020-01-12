kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: components/libpulse.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_BUILD_TYPE=Release \
    -DALSOFT_EXAMPLES=NO

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/alrecord'
        - '%{bindir}/altonegen'
        - '%{bindir}/bsincgen'
        - '%{bindir}/makehrtf'
        - '%{bindir}/openal-info'
        - '%{libdir}/libopenal.so'

sources:
- kind: git_tag
  url: github:kcat/openal-soft.git
  track: master
  ref: openal-soft-1.20.0-0-gc0cf323e1d56ce605e90927324d2fdafcfbb564a
