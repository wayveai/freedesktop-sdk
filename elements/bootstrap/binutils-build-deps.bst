kind: script

depends:
- filename: bootstrap/gnu-config.bst
  type: build
- filename: bootstrap/build/gcc-stage2.bst
  type: build
- filename: bootstrap/build/debug-utils.bst
  type: build
- filename: bootstrap/glibc.bst
  type: build
- filename: bootstrap/zlib.bst
  type: build

variables:
  install-root: "/"

config:
  layout:
  - element: bootstrap/gnu-config.bst
    destination: "/"
  - element: bootstrap/build/gcc-stage2.bst
    destination: "/"
  - element: bootstrap/build/debug-utils.bst
    destination: "/"

  - element: bootstrap/glibc.bst
    destination: "%{sysroot}"
  - element: bootstrap/zlib.bst
    destination: "%{sysroot}"

  commands:
  # zlib may depend on libgcc_s.so.1. This works linking around issues.
  - |
    if [ -f "%{tools}/%{triplet}/%{lib}/libgcc_s.so.1" ]; then
      cp "%{tools}/%{triplet}/%{lib}/libgcc_s.so.1" "%{sysroot}%{libdir}/"
    else
      cp "%{tools}/%{lib}/libgcc_s.so.1" "%{sysroot}%{libdir}/"
    fi
