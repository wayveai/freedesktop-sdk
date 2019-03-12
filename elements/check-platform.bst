kind: check_forbidden

depends:
- filename: desktop-platform.bst
  type: runtime
- filename: base-platform.bst
  type: runtime

config:
  forbidden:
  - desktop/desktop-file-utils.bst
  - desktop/gtk-doc.bst
  - desktop/itstools.bst
  - desktop/jq.bst
  - desktop/libva-utils.bst
  - desktop/mercurial.bst
  - desktop/xorg-util-macros.bst
  - base/autoconf-archive.bst
  - base/autoconf.bst
  - base/automake.bst
  - base/bc.bst
  - base/bison.bst
  - base/ccache.bst
  - base/cmake.bst
  - base/cpio.bst
  - base/docbook-xml.bst
  - base/docbook-xsl.bst
  - base/ed.bst
  - base/gdb.bst
  - base/git.bst
  - base/gperf.bst
  - base/groff.bst
  - base/help2man.bst
  - base/intltool.bst
  - base/libpipeline.bst
  - base/m4.bst
  - base/man-db.bst
  - base/man-pages-posix.bst
  - base/man-pages.bst
  - base/meson.bst
  - base/nasm.bst
  - base/ninja.bst
  - base/perl.bst
  - base/perl-xml-parser.bst
  - base/python2.bst
  - base/python2-docutils.bst
  - base/python2-usercustomize.bst
  - base/openssh.bst
  - base/patch.bst
  - base/pkg-config.bst
  - base/ruby.bst
  - base/strace.bst
  - base/texinfo.bst
  - base/valgrind.bst
