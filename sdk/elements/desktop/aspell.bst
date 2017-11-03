kind: myautotools

depends:
  - filename: base-stack.bst

variables:
  builddir: ''

sources:
  - kind: tar
    url: http://ftp.gnu.org/gnu/aspell/aspell-0.60.6.1.tar.gz
    ref: f52583a83a63633701c5f71db3dc40aab87b7f76b29723aeb27941eff42df6e1
  - kind: patch
    path: elements/desktop/aspell-compile-fix.patch
