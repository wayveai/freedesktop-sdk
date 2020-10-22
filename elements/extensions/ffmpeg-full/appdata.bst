kind: manual

build-depends:
- components/appstream-glib.bst

config:
  build-commands:
  - appstream-util validate org.freedesktop.Platform.ffmpeg-full.appdata.xml

  install-commands:
  - install -Dm644 -t "%{install-root}%{libdir}/ffmpeg/share/appdata" org.freedesktop.Platform.ffmpeg-full.appdata.xml

sources:
- kind: local
  path: files/ffmpeg-full/org.freedesktop.Platform.ffmpeg-full.appdata.xml
