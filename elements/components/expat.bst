kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexpat.so'

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

config:
  configure-commands:
  - |
    cd expat
    %{autogen}

  - |
    mkdir %{build-dir}
    cd %{build-dir}
    ../expat/%{configure}

sources:
- kind: git_tag
  url: github:libexpat/libexpat.git
  track: master
  ref: R_2_4_7-0-g27d5b8ba1771f916d9cfea2aac6bdac72071dc66
