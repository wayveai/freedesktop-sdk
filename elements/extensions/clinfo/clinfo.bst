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
  url: github:Oblomov/clinfo.git
  track: master
  ref: 3.0.21.02.21-0-gd34bc1a3bdc148e2e1fe64998398e1a0552ab04c
