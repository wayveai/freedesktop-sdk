kind: script

build-depends:
- extensions/mesa-aco/llvm9-runtime-filter.bst
- bootstrap-import.bst

config:
  layout:
  - element: extensions/mesa-aco/llvm9-runtime-filter.bst
    destination: /source
  - element: bootstrap-import.bst
    destination: /
  commands:
  - |
    mkdir -p "%{install-root}/usr/lib/%{gcc_triplet}/GL/"
    cp -r "/source/usr/lib/%{gcc_triplet}/GL/default" "%{install-root}/usr/lib/%{gcc_triplet}/GL/mesa-aco"
