kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: git_tag
  url: github:pyparsing/pyparsing.git
  # Frozen because new versions don't work correctly with glib
  ref: pyparsing_3.0.1-0-g465c20f4b232979d07ad905596edcd8ed21b492e
