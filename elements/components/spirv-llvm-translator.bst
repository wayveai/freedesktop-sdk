kind: cmake

depends:
- bootstrap-import.bst
- components/llvm.bst

build-depends:
- public-stacks/buildsystem-cmake.bst

config:
  build-commands:
  - '%{make} llvm-spirv'

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}/" _builddir/tools/llvm-spirv/llvm-spirv

sources:
- kind: git_tag
  track: master
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  ref: v12.0.0-0-g67d3e271a28287b2c92ecef2f5e98c49134e5946
  match:
  - v*
