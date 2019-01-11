kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DSPIRV_WERROR=Off

public:
  bst:
    split-rules:
      devel:
        (>):
          - '%{bindir}/spirv-as'
          - '%{bindir}/spirv-cfg'
          - '%{bindir}/spriv-dis'
          - '%{bindir}/spirv-lesspipe.sh'
          - '%{bindir}/spirv-link'
          - '%{bindir}/spirv-opt'
          - '%{bindir}/spirv-stats'
          - '%{bindir}/spirv-val'

sources:
- kind: tar
  url: github:KhronosGroup/SPIRV-Tools/archive/v2018.6.tar.gz
  ref: e7fccd5e1e134a4ce09a25475ca52c5a8a57085b07e0bbaa39aff20d36911d66
  # SPIRV-Headers should be in the same reference like spirv-headers.bst.
  # Only full git from headers make spirv-tools happy.
  # did't try to sync headers and "touch a reference into the subfolder"
- kind: git
  url: github:KhronosGroup/SPIRV-Headers
  ref: 4618b86e9e4b027a22040732dfee35e399cd2c47
  directory: external/SPIRV-Headers
