kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

runtime-depends:
- components/python3-urllib3.bst
- components/python3-certifi.bst
- components/python3-idna.bst
- components/python3-chardet.bst

sources:
- kind: pypi
  name: requests
  url: pypi:da/67/672b422d9daf07365259958912ba533a0ecab839d4084c487a5fe9a5405f/requests-2.24.0.tar.gz
  sha256sum: b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b
