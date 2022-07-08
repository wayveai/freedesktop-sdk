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
  ref: release-2.0.4-0-gda75a58c19de9fedea62724a5f7770cbbe39adf9
