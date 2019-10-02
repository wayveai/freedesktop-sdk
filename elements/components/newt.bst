kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

- filename: components/slang.bst

variables:
  builddir: ''

sources:
- kind: git_tag
  url: https://pagure.io/newt.git
  track: master
  ref: r0-52-21-0-g134326743ac8063f79b6b34eb9d80ffdd55e6540
