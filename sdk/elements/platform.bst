kind: flatpak-image

config:
  directory: "%{prefix}"
  exclude:
    - debug
    - docs
    - locale

  metadata:
    Runtime:
      name: org.freedesktop.Platform
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    Environment:
      GI_TYPELIB_PATH: /app/lib/girepository-1.0
      GST_PLUGIN_SYSTEM_PATH: /app/lib/gstreamer-1.0:/usr/lib/extensions/gstreamer-1.0:/usr/lib/gstreamer-1.0
      XDG_DATA_DIRS: /app/share:/usr/share:/usr/share/runtime/share:/run/host/share

    'Extension org.freedesktop.Platform.Locale':
      directory: "share/runtime/locale"
      autodelete: true
      locale-subset: true

    'Extension org.freedesktop.Platform.Timezones':
      directory: "share/zoneinfo"

    'Extension org.freedesktop.Platform.GStreamer':
      directory: "lib/extensions/gstreamer-1.0"
      subdirectories: true

    'Extension org.freedesktop.Platform.Icontheme':
      directory: "share/runtime/share/icons"
      subdirectories: true
      no-autodownload: true
      version: "1.0"

    'Extension org.gtk.Gtk3theme':
      directory: "share/runtime/share/themes"
      subdirectories: true
      subdirectory-suffix: "gtk-3.0"
      no-autodownload: true
      version: "3.22"

    'Extension org.freedesktop.Platform.VAAPI.Intel':
      directory: "%{lib}/dri/intel-vaapi-driver"
      autodelete: false

depends:
  - filename: desktop-platform-image.bst
    type: build
