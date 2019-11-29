kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: git_tag
  url: github:aio-libs/async-timeout.git
  track: master
  ref: v4.0.0a2-0-gdc9c1e746ddd4f89677ea04d159b009bf1dc8b56
