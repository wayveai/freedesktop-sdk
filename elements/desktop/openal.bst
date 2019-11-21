kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: desktop/libpulse.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR:PATH=%{lib} \
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
    version: '1.18.2'

sources:
- kind: git_tag
  url: github:kcat/openal-soft.git
  ref: openal-soft-1.18.2-0-gce6076091bac3c00cd10803916e8911495580bd0
