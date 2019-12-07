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
  url: tar_https:files.pythonhosted.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz
  ref: 4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae
