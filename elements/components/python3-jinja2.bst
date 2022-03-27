kind: pip

build-depends:
- components/python3-pip.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: Jinja2
  url: pypi:89/e3/b36266381ae7a1310a653bb85f4f3658c462a69634fa9b2fef76252a50ed/Jinja2-3.1.1.tar.gz
  sha256sum: 640bed4bb501cbd17194b3cace1dc2126f5b619cf068a726b98192a0fde74ae9
