kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DSPIRV_WERROR=Off

  optimize-debug: "false"

config:
  install-commands:
    (>):
    - |
      mkdir --parents %{install-root}%{includedir}/spirv/unified1
      install -m 644 ./external/SPIRV-Headers/include/spirv/unified1/*.h* %{install-root}%{includedir}/spirv/unified1

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
  ref: aa9e8f538041db3055ea443080e0ccc315fa114f
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers
  ref: 45c2cc37276d69e5b257507d97fd90d2a5684ccc
  directory: external/SPIRV-Headers
# We hardcode known-good commits from glslang.bst commit
# https://github.com/KhronosGroup/glslang/blob/333d1c95792692205472c457d7bec915a94c8000/known_good.json
