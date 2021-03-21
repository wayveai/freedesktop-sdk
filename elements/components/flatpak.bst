kind: autotools

depends:
- bootstrap-import.bst
- components/gpgme.bst
- components/libcap.bst
- components/libarchive.bst
- components/libxml2.bst
- components/libsoup.bst
- components/xorg-lib-xau.bst
- components/ostree.bst
- components/fuse.bst
- components/json-glib.bst
- components/appstream-glib.bst
- components/libseccomp.bst
- components/polkit.bst

build-depends:
- components/python3-pyparsing.bst
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/bison.bst
- components/gettext.bst
- components/gobject-introspection.bst
- components/bison.bst

variables:
  conf-local: --disable-documentation

(@):
- elements/include/flatpak.yml
