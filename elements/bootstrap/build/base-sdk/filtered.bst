kind: filter

(?):
- bootstrap_build_arch == "x86_64":
    depends:
    - filename: bootstrap/build/base-sdk/image-x86_64.bst
      type: build
- bootstrap_build_arch == "aarch64":
    depends:
    - filename: bootstrap/build/base-sdk/image-aarch64.bst
      type: build

config:
  exclude:
    - filter
  include-orphans: True

sandbox:
  build-arch: '%{bootstrap_build_arch}'
