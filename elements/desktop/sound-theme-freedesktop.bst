kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/intltool.bst
  type: build

variables:
  conf-local: |
    --disable-webkitgtk

sources:
- kind: tar
  url: tar_https:people.freedesktop.org/~mccann/dist/sound-theme-freedesktop-0.8.tar.bz2
  ref: cb518b20eef05ec2e82dda1fa89a292c1760dc023aba91b8aa69bafac85e8a14
