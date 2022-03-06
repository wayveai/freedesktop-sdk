kind: autotools

(@): elements/extensions/include/app.yml

depends:
- filename: components/xorg-lib-xi.bst
  type: build
- filename: components/mesa-headers.bst
  type: build
- filename: components/freetype.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: extensions/glxinfo/glu.bst
- filename: extensions/glxinfo/glew.bst
- filename: extensions/glxinfo/freeglut.bst

variables:
  build-dir: ''
  conf-local: |
    --enable-osmesa=no

sources:
- kind: git_tag
  url: freedesktop:mesa/demos.git
  track: master
  ref: mesa-demos-8.4.0-0-g317f67fe5e75c685330d536f158acf6260b473d1
