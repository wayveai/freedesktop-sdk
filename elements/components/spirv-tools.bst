kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/spirv-headers.bst

variables:
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DSPIRV_WERROR=Off
    -DSPIRV-Headers_SOURCE_DIR=/usr
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DSPIRV_TOOLS_BUILD_STATIC:BOOL=NO

  optimize-debug: "false"

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
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Tools.git
  track: master
  track-extra:
  - sdk-1.3.211
  match:
  - sdk-*
  ref: sdk-1.3.211.0-0-g7826e1941eab1aa66fbe84c48b95921bff402a96
