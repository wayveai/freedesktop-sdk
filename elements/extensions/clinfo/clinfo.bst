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
  ref: 3.0.20.11.20-0-g1b3c83815f558e17ec69b1b3df7a03ae9313c744
