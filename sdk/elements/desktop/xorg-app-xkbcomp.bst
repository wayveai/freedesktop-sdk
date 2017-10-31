kind: myautotools

depends:
  - filename: base-stack.bst
  - filename: desktop/xorg-util-macros.bst
  - filename: desktop/xorg-proto-x.bst
  - filename: desktop/xorg-lib-x11.bst
  - filename: desktop/xorg-lib-xkbfile.bst

sources:
  - kind: tar
    url: https://www.x.org/archive/individual/app/xkbcomp-1.4.0.tar.bz2
    ref: bc69c8748c03c5ad9afdc8dff9db11994dd871b614c65f8940516da6bf61ce6b

