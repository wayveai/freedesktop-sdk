kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/perl.bst
- components/texinfo.bst

depends:
- bootstrap-import.bst

variables:
  conf-local: >-
    --enable-curses="-ltinfow -lncursesw"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pspell-config'
        - '%{libdir}/libaspell.so'
        - '%{libdir}/libpspell.so'

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_tag
  url: savannah:aspell.git
  track: master
  track-extra:
  - rel-0.60.8-branch
  match:
  - rel-*
  ref: rel-0.60.8-0-gc96f9b06576cde08300c14f288727c754038fe3f
