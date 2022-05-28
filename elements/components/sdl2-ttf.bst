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
  exclude:
  - 'candidate*'
  ref: release-2.0.18-0-g3e702ed9bf400b0a72534f144b8bec46ee0416cb
