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
  cpe:
    version: '1.19.1'

sources:
- kind: git_tag
  url: github:kcat/openal-soft.git
  track: master
  ref: openal-soft-1.19.1-0-g6761218e51699f46bf25c377e65b3e9ea5e434b9
