kind: manual

depends:
- filename: bootstrap-import.bst
- filename: desktop/opencl.bst
- filename: extensions/clinfo/khronos-headers.bst
  type: build

config:
  build-commands:
    - make
  install-commands:
    - make -j1 PREFIX=%{install-root}/app install

sources:
- kind: git
  url: https://github.com/Oblomov/clinfo
  track: 2.2.18.04.06
  ref: 59d0daf898e48d76ccbb788acbba258fa0a8ba7c
