kind: autotools

depends:
- bootstrap-import.bst
- components/util-linux-full.bst
- components/lvm2.bst

sources:
- kind: tar
  url: ftp_gnu_org:parted/parted-3.4.tar.xz
  ref: e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342

# We have decided to stay with tarballs on this one, because the build
# system is too annoying when building from git. Parted  apparently
# uses rsync to download the po files (translations), so the build
# process  searches for rsync, to download them. However, buildstream
# doesn't let builds access the network, It will be need to change the
# parted build system so that it doesn't use rsync at all by patching it,
# but if you just patch out the calls to rsync, then we lose translations.
# So you'd have to rsync them beforehand, and add them to our repo as additional sources.
