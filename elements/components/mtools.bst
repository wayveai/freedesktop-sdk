kind: autotools

depends:
- bootstrap-import.bst

sources:
- kind: tar
  # Pinned to 4.0.27 due to regression in mcopy; see https://gitlab.gnome.org/GNOME/gnome-build-meta/-/issues/398#note_1242162
  url: ftp_gnu_org:mtools/mtools-4.0.27.tar.bz2
  ref: 9c88c8d9244e54768e40b92c005e61ec4e084ea7c070df9184caf1a6408838b3
