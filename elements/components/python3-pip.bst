kind: distutils

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: pypi
  name: pip
  url: pypi:03/41/6da553f689d530bc2c337d2c496a40dc9c0fdc6481e5df1f3ee3b8574479/pip-20.3.tar.gz
  sha256sum: 9ae7ca6656eac22d2a9b49d024fc24e00f68f4c4d4db673d2d9b525c3dea6e0e
