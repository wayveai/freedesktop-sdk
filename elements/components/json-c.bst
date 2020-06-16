kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:json-c/json-c.git
  track: json-c-0.14
  ref: json-c-0.14-20200419-0-gbae2f10c436eaf0d95746cbc5f1c1f0ecb866a8e
