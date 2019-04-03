kind: stack
description: Stack of components in freedesktop SDK

depends:
- filename: base.bst                        # Note we include all elements in the base sdk
- filename: desktop-platform.bst            # and the platform
- filename: desktop/desktop-file-utils.bst
- filename: desktop/gtk-doc.bst
- filename: desktop/itstools.bst
- filename: desktop/jq.bst
- filename: desktop/libva-utils.bst
- filename: desktop/mercurial.bst
- filename: desktop/wayland-protocols.bst
- filename: desktop/xorg-proto-xcb.bst
- filename: desktop/xorg-proto-xorgproto.bst
- filename: desktop/xorg-util-macros.bst
