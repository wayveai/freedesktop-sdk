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
  url: pypi:b7/2d/ad02de84a4c9fd3b1958dc9fb72764de1aa2605a9d7e943837be6ad82337/pip-21.0.1.tar.gz
  sha256sum: 99bbde183ec5ec037318e774b0d8ae0a64352fe53b2c7fd630be1d07e94f41e5
- kind: patch
  path: patches/pip/make-pip-temp-dirs-reproducible.patch
