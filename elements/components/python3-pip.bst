kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/python3-setuptools.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/pip"

sources:
- kind: pypi
  name: pip
  url: pypi:00/5f/d6959d6f25f202e3e68e3a53b815af42d770c829c19382d0acbf2c3e2112/pip-21.3.tar.gz
  sha256sum: 741a61baab1dbce2d8ca415effa48a2b6a964564f81a9f4f1fce4c433346c034

