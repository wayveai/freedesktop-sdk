kind: stack

depends:
- filename: bootstrap-import.bst
- filename: multiarch-platform-arches.bst

variables:
  arches: ''
  (?):
  - target_arch == "x86_64":
      arches: >-
        i386-linux-gnu

  - target_arch == "aarch64":
      arches: >-
        arm-linux-gnueabihf

public:
  bst:
    integration-commands:
    - |
      for i in %{arches}; do
        if [ "${i}" != "%{gcc_triplet}" ]; then
          ln -sr "/app/lib/${i}" "%{indep-libdir}/${i}"
        fi
      done
