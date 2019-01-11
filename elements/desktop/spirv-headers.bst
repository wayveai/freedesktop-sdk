kind: manual

# SPIRV-Headers should be in the same reference like spirv-tools.bst

depends:
- filename: bootstrap-import.bst
  type: build

config:
  install-commands:
  - |
    mkdir --parents %{install-root}%{includedir}/spirv/unified1
    install -m 644 ./include/spirv/unified1/spirv.h %{install-root}%{includedir}/spirv/unified1
    install -m 644 ./include/spirv/unified1/spirv.hpp %{install-root}%{includedir}/spirv/unified1
    install -m 644 ./include/spirv/unified1/spirv.hpp11 %{install-root}%{includedir}/spirv/unified1
    install -m 644 ./include/spirv/unified1/GLSL.std.450.h %{install-root}%{includedir}/spirv/unified1
    install -m 644 ./include/spirv/unified1/OpenCL.std.h %{install-root}%{includedir}/spirv/unified1

sources:
- kind: git
  url: github:KhronosGroup/SPIRV-Headers
  ref: 4618b86e9e4b027a22040732dfee35e399cd2c47
