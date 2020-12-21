kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/glslang.bst
- components/git-minimal.bst

depends:
- components/spirv-tools.bst
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DSHADERC_SKIP_TESTS:BOOL=YES

config:
  configure-commands:
    (<):
    - |
      cat <<EOF >glslc/src/build-version.inc
      "shaderc $(git describe | sed 's/^v//')"
      "spriv-tools $(spirv-cfg --version | sed '/^SPIRV-Tools v\([^ ]*\) .*$/{;s//\1/;q;};d')"
      "glslang $(glslangValidator --version | sed '/^Glslang Version: /{;s///;q;};d')"
      EOF

sources:
- kind: git_tag
  url: github:google/shaderc.git
  track: main
  ref: v2020.4-0-g0dbd899941a43ffd55df527d65128b3b66e75c9c
- kind: patch
  path: patches/shaderc/what-a-mess.patch
