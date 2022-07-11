kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libflac.bst
- components/libvorbis.bst
- components/mpg123.bst
- components/sdl2.bst
- components/opusfile.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_mixer.so'

sources:
- kind: git_tag
  url: github:libsdl-org/SDL_mixer.git
  track: main
  match:
  - 'release*'
  ref: release-2.6.0-0-g738611693dc324001cc00f5b800e3d18fb42cb4e
