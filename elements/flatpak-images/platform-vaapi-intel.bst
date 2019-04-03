kind: flatpak_image

depends:
- filename: extensions/platform-vaapi-intel/intel-vaapi-driver.bst
  type: build

config:
  directory: '%{libdir}/dri/intel-vaapi-driver'

  metadata:
    Runtime:
      name: org.freedesktop.Platform.VAAPI.Intel
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}
