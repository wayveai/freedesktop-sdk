kind: flatpak_image

depends:
- filename: extensions/openh264/apply-extra.bst
  type: build

variables:
  (?):
  - target_arch == "i686":
      uri: "https://github.com/cisco/openh264/releases/download/v2.0.0/libopenh264-2.0.0-linux32.5.so.bz2"
      checksum: 954137030be6694e46feaecacda685e1809d9cc56bf215cf1180067e44350b6b
      size: '590093'
  - target_arch == "x86_64":
      uri: "https://github.com/cisco/openh264/releases/download/v2.0.0/libopenh264-2.0.0-linux64.5.so.bz2"
      checksum: 126933c9453e426e7ac3051261198a0d78421982f2f58c9a5ce3e0e88a073038
      size: '592986'

config:
  directory: "%{prefix}"
  metadata:
    Runtime:
      name: org.freedesktop.Platform.openh264
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}
      required-flatpak: 1.4.2;1.2.5;1.0.9;

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}

    Extra Data:
      name: libopenh264.so.bz2
      checksum: "%{checksum}"
      size: "%{size}"
      uri: "%{uri}"
