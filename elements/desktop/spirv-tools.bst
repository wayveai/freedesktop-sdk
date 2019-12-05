kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DSPIRV_WERROR=Off

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
  ref: v2019.1-0-g2297d4a3dfcbfd2a8b4312fab055ae26e3289fd3
  # SPIRV-Headers should be in the same reference like spirv-headers.bst.
  # Only full git from headers make spirv-tools happy.
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers.git
  ref: 8bea0a266ac9b718aa0818d9e3a47c0b77c2cb23
  directory: external/SPIRV-Headers
