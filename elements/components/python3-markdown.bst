kind: pip

depends:
- filename: bootstrap-import.bst
- filename: components/python3.bst
- filename: components/python3-setuptools.bst
- filename: components/python3-pip.bst
  type: build
- filename: components/python3-wheel.bst
  type: build

sources:
- kind: git_tag
  url: github:Python-Markdown/markdown.git
  # Frozen, updating further introduces new runtime dependencies
  ref: 3.3.4-0-g14c2fa92302084e4850e5323ed56721e43fbbdb9
