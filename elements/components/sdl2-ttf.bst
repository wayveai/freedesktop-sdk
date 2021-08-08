kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/freetype.bst
- components/sdl2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_ttf.so'

sources:
- kind: git_tag
  url: github:libsdl-org/SDL_ttf.git
  track: main
  ref: release-2.0.15-0-g33cdd1881e31184b49a68b4890d1d256fc0c6dc1
