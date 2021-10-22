kind: pip

depends:
- components/python3.bst
- components/python3-setuptools.bst
- components/git.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: git_tag
  url: github:pypa/setuptools_scm.git
  track: main
  ref: v3.3.3-0-gfe2ea13e9d00c7f0873f149de42b1deaca4aa924
