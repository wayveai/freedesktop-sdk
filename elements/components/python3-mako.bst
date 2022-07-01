kind: pip

build-depends:
- public-stacks/buildsystem-python.bst

depends:
- components/python3.bst
- components/python3-markupsafe.bst

public:
  cpe:
    version-match: '(\d+)_(\d*)_(\d*)'

sources:
- kind: git_tag
  url: github:sqlalchemy/mako.git
  track: main
  ref: rel_1_2_1-0-g00f1b33b13088ce17b11a63ee0d1d78aa204fceb
