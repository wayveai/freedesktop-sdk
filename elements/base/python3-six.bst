kind: pip

depends:
- filename: bootstrap-import.bst
- filename: base/python3.bst
- filename: base/python3-pip.bst

variables:
  pip: pip3
  fix-pyc-timestamps: "true"

sources:
- kind: tar
  url: tar_https:pypi.python.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz
  ref: 70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9
