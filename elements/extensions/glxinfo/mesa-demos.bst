kind: autotools

(@): elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/xorg-lib-xi.bst
- components/mesa-headers.bst
- components/freetype.bst

depends:
- extensions/glxinfo/glu.bst
- extensions/glxinfo/glew.bst
- extensions/glxinfo/freeglut.bst

variables:
  conf-local: >-
    --enable-osmesa=no

sources:
- kind: git_tag
  url: freedesktop:mesa/demos.git
  track: master
  ref: mesa-demos-8.4.0-0-g317f67fe5e75c685330d536f158acf6260b473d1
