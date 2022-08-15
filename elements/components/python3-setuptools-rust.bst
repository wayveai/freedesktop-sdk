kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst
- components/python3-semantic-version.bst
- components/python3-setuptools.bst
- components/python3-typing-extensions.bst

sources:
- kind: pypi
  name: setuptools-rust
  ref:
    sha256sum: 0e05e456645d59429cb1021370aede73c0760e9360bbfdaaefb5bced530eb9d7
    suffix: dc/20/0b16eb0dd28c3ec6fccef77230b11e4b9ec94aa7ade1c99b1ab66d237fbe/setuptools-rust-1.5.1.tar.gz
