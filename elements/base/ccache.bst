kind: autotools

depends:
- filename: bootstrap-import.bst

sources:
- kind: tar
  url: tar_https:www.samba.org/ftp/ccache/ccache-3.4.2.tar.xz
  ref: 18a8b14367d63d3d37fb6c33cba60e1b7fcd7a63d608df97c9771ae0d234fee2
- kind: patch
  path: patches/ccache/ccache-toctou-fix.patch
