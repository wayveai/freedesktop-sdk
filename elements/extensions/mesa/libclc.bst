kind: cmake

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/llvm.bst
- components/spirv-tools.bst
- components/spirv-llvm-translator.bst

(@):
- elements/include/llvm.yml
- elements/extensions/mesa/config.yml

variables:
  cmake: cmake "-B%{build-dir}" -Slibclc -G"%{generator}" %{cmake-args}
