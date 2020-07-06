kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/systemd.bst
- bootstrap-import.bst

sources:
- kind: git_tag
  url: git_https:git.0pointer.net/libatasmart.git/
  track: master
  ref: v0.19-0-gde6258940960443038b4c1651dfda3620075e870
