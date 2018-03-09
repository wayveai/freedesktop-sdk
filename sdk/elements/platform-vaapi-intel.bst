kind: flatpak-image

depends:
  - filename: platform-vaapi-intel/intel-vaapi-driver.bst
    type: build

config:
  directory: "%{prefix}"
  
  metadata:
    Application:
      name: org.freedesktop.Platform
      runtime: org.freedesktop.Platform/%{gcc_arch}/%{branch}
      sdk: org.freedesktop.Sdk/%{gcc_arch}/%{branch}
