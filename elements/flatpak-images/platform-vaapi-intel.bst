kind: flatpak_image

depends:
- filename: extensions/platform-vaapi-intel/intel-vaapi-driver.bst
  type: build
- filename: extensions/platform-vaapi-intel/intel-media-driver.bst
  type: build

(?):
- target_arch == "i686":
    depends:
    - filename: extensions/platform-vaapi-intel/intel-vaapi-driver.bst
      type: build

config:
  directory: '%{libdir}/dri/intel-vaapi-driver'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.VAAPI.Intel
      runtime: org.freedesktop.Platform/%{flatpak_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{flatpak_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{flatpak_arch}/%{branch}
