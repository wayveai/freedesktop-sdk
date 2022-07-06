kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-markupsafe.bst

sources:
- kind: pypi
  name: mako
  ref:
    sha256sum: f054a5ff4743492f1aa9ecc47172cb33b42b9d993cffcc146c9de17e717b0307
    suffix: ad/dd/34201dae727bb183ca14fd8417e61f936fa068d6f503991f09ee3cac6697/Mako-1.2.1.tar.gz
