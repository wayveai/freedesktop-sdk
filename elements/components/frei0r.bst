kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/cairo.bst

sources:
- kind: git_tag
  url: github:dyne/frei0r.git
  track: master
  ref: v1.6.1-0-ge107f0549c59e02c664088471edb2318cebb19b7
- kind: patch
  path: patches/frei0r/frei0r-Stop-hardcoding-pkgconfig-location.patch
- kind: patch
  path: patches/frei0r/frei0r-Stop-hardcoding-libdir-location.patch
