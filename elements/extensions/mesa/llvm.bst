kind: manual

build-depends:
- components/llvm.bst
- bootstrap-import.bst

variables:
  # Strip was already done
  strip-commands: "true"
  libraries: >-
    libLLVM.so
    libclang-cpp.so

config:
  install-commands:
  - |
    for lib in %{libraries}; do
      real_lib=$(objdump -p "/usr/lib/%{gcc_triplet}/${lib}"  | sed '/^ *SONAME */{;s///;q;};d')
      install -Dm644 -t '%{install-root}%{libdir}' "/usr/lib/%{gcc_triplet}/${real_lib}"
    done

(@):
- elements/extensions/mesa/config.yml

