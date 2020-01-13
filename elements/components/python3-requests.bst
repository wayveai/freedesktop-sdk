kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

runtime-depends:
- components/python3-urllib3.bst
- components/python3-certifi.bst
- components/python3-idna.bst
- components/python3-chardet.bst

sources:
- kind: git_tag
  url: github:kennethreitz/requests.git
  track: master
  ref: v2.22.0-0-gaeda65bbe57ac5edbcc2d80db85d010befb7d419
