kind: autotools
description: Tool to help find memory-management problems in programs

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/gdb.bst
- filename: components/perl.bst
  type: build

variables:
  # valgrind does not like the strong stack protector flag
  target_flags_stack_protector_strong: ''

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/valgrind"
      mv "%{install-root}%{includedir}/valgrind/config.h" "%{install-root}%{includedir}/%{gcc_triplet}/valgrind/"

public:
  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_tag
  url: repo_or_cz:valgrind.git
  track: master
  ref: VALGRIND_3_15_0-0-g608cb11914e5f23d0fc12c61dad29c5c7952a1de
- kind: patch
  path: patches/valgrind/valgrind-arm-hot_cpu.patch
- kind: patch
  path: patches/valgrind/valgrind-gcc-libc-dependency-aarch64.patch
