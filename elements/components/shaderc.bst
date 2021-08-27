kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst

depends:
- components/glslang.bst
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
  ref: v2021.2-0-gd0d8d7e7ea5074cb107499a73a22ce14bec3fb10
- kind: patch
  path: patches/shaderc/what-a-mess.patch
