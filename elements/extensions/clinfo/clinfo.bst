kind: manual

(@): elements/extensions/include/app.yml

depends:
- filename: bootstrap-import.bst
- filename: components/opencl.bst
- filename: extensions/clinfo/khronos-headers.bst
  type: build

config:
  build-commands:
    - make
  install-commands:
    - make -j1 PREFIX=%{install-root}%{prefix} install

sources:
- kind: git_tag
  url: github:Oblomov/clinfo
  track: master
  ref: 2.2.18.04.06-0-g59d0daf898e48d76ccbb788acbba258fa0a8ba7c
