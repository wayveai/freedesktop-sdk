kind: compose

depends:
- filename: base.bst
  type: build
- filename: desktop/alsa-lib.bst
  type: build
- filename: desktop/alsa-plugins.bst
  type: build
- filename: desktop/appstream-glib.bst
  type: build
- filename: desktop/aspell.bst
  type: build
- filename: desktop/atk.bst
  type: build
- filename: desktop/at-spi2-atk.bst
  type: build
- filename: desktop/at-spi2-core.bst
  type: build
- filename: desktop/cairo.bst
  type: build
- filename: desktop/cups.bst
  type: build
- filename: desktop/dbus.bst
  type: build
- filename: desktop/dejavu-fonts.bst
  type: build
- filename: desktop/desktop-file-utils.bst
  type: build
- filename: desktop/flatpak-xdg-utils.bst
  type: build
- filename: desktop/fontconfig.bst
  type: build
- filename: desktop/freetype.bst
  type: build
- filename: desktop/gcab.bst
  type: build
- filename: desktop/gdk-pixbuf.bst
  type: build
- filename: desktop/geoclue2.bst
  type: build
- filename: desktop/glib-networking.bst
  type: build
- filename: desktop/gnu-free-fonts.bst
  type: build
- filename: desktop/gobject-introspection.bst
  type: build
- filename: desktop/graphite2.bst
  type: build
- filename: desktop/gstreamer.bst
  type: build
- filename: desktop/gstreamer-plugins-bad.bst
  type: build
- filename: desktop/gstreamer-plugins-base.bst
  type: build
- filename: desktop/gstreamer-plugins-good.bst
  type: build
- filename: desktop/gstreamer-plugins-ugly.bst
  type: build
- filename: desktop/gtk3.bst
  type: build
- filename: desktop/harfbuzz.bst
  type: build
- filename: desktop/hicolor-icon-theme.bst
  type: build
- filename: desktop/hunspell.bst
  type: build
- filename: desktop/hyphen.bst
  type: build
- filename: desktop/ibus.bst
  type: build
- filename: desktop/itstools.bst
  type: build
- filename: desktop/json-glib.bst
  type: build
- filename: desktop/libcroco.bst
  type: build
- filename: desktop/libdatrie.bst
  type: build
- filename: desktop/libdrm.bst
  type: build
- filename: desktop/libepoxy.bst
  type: build
- filename: desktop/liberation-fonts.bst
  type: build
- filename: desktop/libglvnd.bst
  type: build
- filename: desktop/libproxy.bst
  type: build
- filename: desktop/librsvg.bst
  type: build
- filename: desktop/libseccomp.bst
  type: build
- filename: desktop/libsoup.bst
  type: build
- filename: desktop/libthai.bst
  type: build
- filename: desktop/libva.bst
  type: build
- filename: desktop/libva-vdpau-driver.bst
  type: build
- filename: desktop/libvdpau.bst
  type: build
- filename: desktop/libxkbcommon.bst
  type: build
- filename: desktop/llvm5.bst
  type: build
- filename: desktop/mesa.bst
  type: build
- filename: desktop/mpg123.bst
  type: build
- filename: desktop/multiarch-links.bst
  type: build
- filename: desktop/mythes.bst
  type: build
- filename: desktop/openal.bst
  type: build
- filename: desktop/orc.bst
  type: build
- filename: desktop/pango.bst
  type: build
- filename: desktop/pixman.bst
  type: build
- filename: desktop/pulseaudio.bst
  type: build
- filename: desktop/sdl2.bst
  type: build
- filename: desktop/sdl2-image.bst
  type: build
- filename: desktop/sdl2-mixer.bst
  type: build
- filename: desktop/sdl2-net.bst
  type: build
- filename: desktop/sdl2-ttf.bst
  type: build
- filename: desktop/shared-mime-info.bst
  type: build
- filename: desktop/vulkan.bst
  type: build
- filename: desktop/wayland.bst
  type: build
- filename: desktop/wayland-protocols.bst
  type: build
- filename: desktop/xcb-util.bst
  type: build
- filename: desktop/xcb-util-cursor.bst
  type: build
- filename: desktop/xcb-util-image.bst
  type: build
- filename: desktop/xcb-util-keysyms.bst
  type: build
- filename: desktop/xcb-util-renderutil.bst
  type: build
- filename: desktop/xcb-util-wm.bst
  type: build
- filename: desktop/xorg-app-xkbcomp.bst
  type: build
- filename: desktop/xorg-data-xkeyboard-config.bst
  type: build
- filename: desktop/xorg-lib-ice.bst
  type: build
- filename: desktop/xorg-lib-pciaccess.bst
  type: build
- filename: desktop/xorg-lib-pthread-stubs.bst
  type: build
- filename: desktop/xorg-lib-sm.bst
  type: build
- filename: desktop/xorg-lib-x11.bst
  type: build
- filename: desktop/xorg-lib-xau.bst
  type: build
- filename: desktop/xorg-lib-xcb.bst
  type: build
- filename: desktop/xorg-lib-xcomposite.bst
  type: build
- filename: desktop/xorg-lib-xcursor.bst
  type: build
- filename: desktop/xorg-lib-xdamage.bst
  type: build
- filename: desktop/xorg-lib-xdmcp.bst
  type: build
- filename: desktop/xorg-lib-xext.bst
  type: build
- filename: desktop/xorg-lib-xfixes.bst
  type: build
- filename: desktop/xorg-lib-xft.bst
  type: build
- filename: desktop/xorg-lib-xi.bst
  type: build
- filename: desktop/xorg-lib-xinerama.bst
  type: build
- filename: desktop/xorg-lib-xkbfile.bst
  type: build
- filename: desktop/xorg-lib-xpm.bst
  type: build
- filename: desktop/xorg-lib-xrandr.bst
  type: build
- filename: desktop/xorg-lib-xrender.bst
  type: build
- filename: desktop/xorg-lib-xscrnsaver.bst
  type: build
- filename: desktop/xorg-lib-xshmfence.bst
  type: build
- filename: desktop/xorg-lib-xt.bst
  type: build
- filename: desktop/xorg-lib-xtrans.bst
  type: build
- filename: desktop/xorg-lib-xtst.bst
  type: build
- filename: desktop/xorg-lib-xv.bst
  type: build
- filename: desktop/xorg-lib-xxf86vm.bst
  type: build
- filename: desktop/xorg-proto-bigreqs.bst
  type: build
- filename: desktop/xorg-proto-composite.bst
  type: build
- filename: desktop/xorg-proto-damage.bst
  type: build
- filename: desktop/xorg-proto-dmx.bst
  type: build
- filename: desktop/xorg-proto-dri2.bst
  type: build
- filename: desktop/xorg-proto-dri3.bst
  type: build
- filename: desktop/xorg-proto-evieext.bst
  type: build
- filename: desktop/xorg-proto-fixes.bst
  type: build
- filename: desktop/xorg-proto-fonts.bst
  type: build
- filename: desktop/xorg-proto-gl.bst
  type: build
- filename: desktop/xorg-proto-input.bst
  type: build
- filename: desktop/xorg-proto-kb.bst
  type: build
- filename: desktop/xorg-proto-present.bst
  type: build
- filename: desktop/xorg-proto-randr.bst
  type: build
- filename: desktop/xorg-proto-record.bst
  type: build
- filename: desktop/xorg-proto-render.bst
  type: build
- filename: desktop/xorg-proto-resource.bst
  type: build
- filename: desktop/xorg-proto-scrnsaver.bst
  type: build
- filename: desktop/xorg-proto-video.bst
  type: build
- filename: desktop/xorg-proto-x.bst
  type: build
- filename: desktop/xorg-proto-xcb.bst
  type: build
- filename: desktop/xorg-proto-xcmisc.bst
  type: build
- filename: desktop/xorg-proto-xext.bst
  type: build
- filename: desktop/xorg-proto-xf86bigfont.bst
  type: build
- filename: desktop/xorg-proto-xf86dga.bst
  type: build
- filename: desktop/xorg-proto-xf86dri.bst
  type: build
- filename: desktop/xorg-proto-xf86misc.bst
  type: build
- filename: desktop/xorg-proto-xf86vidmode.bst
  type: build
- filename: desktop/xorg-proto-xinerama.bst
  type: build
- filename: desktop/xorg-proto-xproxymanagement.bst
  type: build
- filename: desktop/xorg-util-macros.bst
  type: build
