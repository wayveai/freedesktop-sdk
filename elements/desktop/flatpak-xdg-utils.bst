kind: meson

depends:
- filename: bootstrap-import.bst
- filename: base/buildsystem-meson.bst
  type: build
- filename: base/glib.bst

sources:
- kind: git_tag
  url: https://github.com/flatpak/flatpak-xdg-utils.git
  track: master
  ref: 0276d66df34f76c120bc6e15565f879e01bc0058    # 0.1-16-g0276d66
