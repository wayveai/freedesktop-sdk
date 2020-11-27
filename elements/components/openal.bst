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
  match:
  - 'openal-soft-1.20.*'
  ref: openal-soft-1.20.1-0-gf5e0eef34db3a3ab94b61a2f99f84f078ba947e7
