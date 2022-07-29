kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  ref:
    sha256sum: c42da944c8a40d998790d7963be0edabd24b9cd1bcc610577ede27eb9e0084d8
    suffix: e3/96/ff430960a664e571285365009bf526fa8ec67267a9632b758914adf9206c/Cython-0.29.31.tar.gz
