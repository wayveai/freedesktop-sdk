kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/libxml2.bst
- filename: components/glib.bst
- filename: components/itstools.bst
  type: build

config:
  build-commands:
    (<):
    - |
      make -C "%{builddir}" shared-mime-info.pot
      cp "%{builddir}/shared-mime-info.pot" .

sources:
- kind: git_tag
  url: freedesktop:xdg/shared-mime-info.git
  track: master
  ref: Release-1-12-0-g41a9a684249cd47aef4d65f81180ee69aa358d71
- kind: patch
  path: patches/shared-mime-info/shared-mime-info-gettext.patch
