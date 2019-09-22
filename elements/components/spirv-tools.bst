kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/spirv-headers.bst

variables:
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DSPIRV_WERROR=Off
    -DSPIRV-Headers_SOURCE_DIR=/usr

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
  url: github:KhronosGroup/SPIRV-Tools
  track: stable
  ref: v2019.4-0-gd65513e92c3fc2832248ce4a4b4343c6220caffc
  # When updating, please also track spriv-headers.bst. You have
  # to manually enable tracking spriv-headers.bst.
