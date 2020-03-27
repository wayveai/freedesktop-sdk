kind: cmake

depends:
- bootstrap-import.bst
- components/llvm.bst

build-depends:
- public-stacks/buildsystem-cmake.bst

variables:
  cmake: cmake "-B%{build-dir}" -Slibclc -G"%{generator}" %{cmake-args}

(@): elements/include/llvm.yml
