kind: pip

depends:
- components/python3.bst

build-depends:
- components/python3-pip.bst

sources:
- kind: pypi
  name: urllib3
  ref:
    sha256sum: ea6e8fb210b19d950fab93b60c9009226c63a28808bc8386e05301e25883ac0a
    suffix: 6d/d5/e8258b334c9eb8eb78e31be92ea0d5da83ddd9385dc967dd92737604d239/urllib3-1.26.11.tar.gz
