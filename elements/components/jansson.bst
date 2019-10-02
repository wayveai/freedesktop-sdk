kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

sources:
- kind: git_tag
  url: github:akheron/jansson.git
  track: master
  track-extra:
  - '2.12'
  ref: v2.12-0-g71c4e8ec215afa225ac20eed269a14963cd37b50
