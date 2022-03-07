kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/slang.bst
- components/popt.bst

variables:
  # newt has enforcing that Makefile is up to date by using
  # configure.ac which breaks when build-dir is used
  build-dir: ''

sources:
- kind: git_tag
  url: pagure:newt.git
  track: master
  ref: r0-52-21-0-g134326743ac8063f79b6b34eb9d80ffdd55e6540
