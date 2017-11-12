kind: flatpak-image

config:
  directory: "%{libdir}"
  exclude:
    - debug
    - devel

  metadata:
    Runtime:
      name: org.freedesktop.Platform.Compat.%{gcc_arch}

    ExtensionOf:
      ref: runtime/org.freedesktop.Platform/%{gcc_arch}/%{branch}

depends:
  - filename: desktop.bst
    type: build
