kind: pip

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

build-depends:
- components/python3-pip.bst
- components/python3-wheel.bst

sources:
- kind: pypi
  name: meson
  url: pypi:48/fb/09b5098772ce484b203be026d8047c596a28107e1ecc0df1412058d9f715/meson-0.60.3.tar.gz
  sha256sum: 87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e
- kind: patch
  path: patches/meson/meson-no-lib64.patch
