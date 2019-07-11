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
  url: github:KhronosGroup/SPIRV-Tools
  ref: v2019.3-0-gce19e217bc82e1dbd631b6a555b1874432f3a05f
  track: master
  exclude:
  - master-tot
  - untagged-*
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers
  ref: 1.4.1-0-gc4f8f65792d4bf2657ca751904c511bbcf2ac77b
  track: master
  directory: external/SPIRV-Headers
