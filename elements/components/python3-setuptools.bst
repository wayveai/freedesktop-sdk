kind: distutils

depends:
- bootstrap-import.bst
- components/python3.bst
- components/util-linux.bst

config:
  configure-commands:
    (<):
    - |
      python3 bootstrap.py

  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}/easy_install"

sources:
- kind: pypi
  name: setuptools
  url: pypi:82/2f/ef7afd98530d07c89deffec833b4b1a91a27a5db6d9f1a216599f5f0316e/setuptools-51.1.2.tar.gz
  sha256sum: 4fa149145ba5dcd4aaa89912ec92393a31170eaf17fe0268b1429538bad1f85a
