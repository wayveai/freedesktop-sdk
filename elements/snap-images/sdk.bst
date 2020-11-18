kind: snap_image

(@):
- snap-version.yml

config:
  directory: "/"
  exclude:
    - debug
    - docs
    - locale

  metadata:
    name: "freedesktop-sdk-sdk-%{snap-branch}"
    version: "%{runtime-version}"
    summary: "Freedesktop SDK %{snap-branch} SDK for snap"
    description: >-
      The Freedesktop SDK project provides Platform and SDK runtimes
      for Flatpak apps and runtimes based on Freedesktop modules.  It
      was originally started as a Flatpak subproject to create a
      basic-neutral runtime. It is now a separate project, similar to
      what happened with the GNOME and KDE runtimes.  This runtime is
      provided to Snap in order run flatpak applications.
    type: base
    architectures:
      - "%{snap_arch}"
    grade: "%{snap_grade}"
    assumes:
    - snapd2.45

build-depends:
- snap-images/sdk-fix-image.bst
