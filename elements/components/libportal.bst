kind: meson

depends:
- bootstrap-import.bst
- components/glib.bst

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst

sources:
- kind: git_tag
  url: github:flatpak/libportal.git
  # Libportal 0.5 breaks ABI so we freeze
  ref: 0.4-0-gf68764e288ede516d902b131cc4fadded3804059
