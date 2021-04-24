kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

runtime-depends:
- components/python3.bst

sources:
- kind: pypi
  name: cython
  url: pypi:d9/cd/0d2d90b27219c07f68f1c25bcc7b02dd27639d2180add9d4b73e70945869/Cython-0.29.23.tar.gz
  sha256sum: 6a0d31452f0245daacb14c979c77e093eb1a546c760816b5eed0047686baad8e
