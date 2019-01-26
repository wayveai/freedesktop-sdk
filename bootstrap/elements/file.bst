kind: autotools

depends:
- filename: dependencies/base-sdk.bst
  type: build
- filename: gnu-config.bst
  type: build
- filename: linux-headers.bst
  type: build
- filename: gcc-stage2.bst
  type: build
- filename: binutils-stage1.bst
  type: build
- filename: glibc.bst
  type: build
- filename: cross-installation-links.bst
  type: build
- filename: file-stage1.bst
  type: build
- filename: zlib.bst
- filename: debugedit-host.bst
  type: build

(@): target.yml

config:
  install-commands:
  - |
    cd "%{builddir}"
    %{cross-install}
  - |
    %{delete_libtool_files}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{sysroot}%{libdir}/libmagic.so'

sources:
- kind: tar
  url: ftp://ftp.astron.com/pub/file/file-5.35.tar.gz
  ref: 30c45e817440779be7aac523a905b123cba2a6ed0bf4f5439e1e99ba940b5546
