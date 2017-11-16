kind: flatpak-image

config:
  directory: "%{prefix}"
  exclude:
    - debug

  metadata:
    Runtime:
      name: org.freedesktop.Platform
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    Environment:
      GI_TYPELIB_PATH: /app/lib/girepository-1.0
      GST_PLUGIN_SYSTEM_PATH: /app/lib/gstreamer-1.0:/usr/lib/extensions/gstreamer-1.0:/usr/lib/gstreamer-1.0
      XDG_DATA_DIRS: /app/share:/usr/share:/usr/share/runtime/share:/run/host/share

    (?):
      - target_arch == "x86_64":
          'Extension org.freedesktop.Platform.Compat.i386':
            directory: "lib/i386-linux-gnu"
            add-ld-path: .
      - target_arch == "aarch64":
          'Extension org.freedesktop.Platform.Compat.arm':
            directory: "lib/arm-linux-gnu"
            add-ld-path: .

depends:
  - filename: desktop-platform-image.bst
    type: build
