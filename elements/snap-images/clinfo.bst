kind: snap_image

(@):
- snap-version.yml

variables:
  lib: lib
  prefix: /app

config:
  directory: "/"
  include:
    - app
  exclude:
    - debug
    - devel
  include-orphans: False

  metadata:
    name: "freedesktop-sdk-clinfo-%{snap-branch}"
    version: "%{runtime-version}"
    summary: "clinfo for Freedesktop SDK %{branch}"
    description: >-
      clinfo provides information on available OpenCL devices. This is
      targeted to run on Freedesktop SDK runtime.  This application is
      meant for troubleshooting issues with OpenCL when using
      Freedesktop SDK runtime.
    type: app
    base: "freedesktop-sdk-runtime-%{snap-branch}"
    architectures:
      - "%{snap_arch}"
    confinement: strict
    grade: "%{snap_grade}"
    apps:
      clinfo:
        command: clinfo-wrapper
        plugs:
          - x11
          - opengl
          - wayland
    layout:
      /var/app:
        bind: $SNAP/app

depends:
  - filename: extensions/clinfo/clinfo.bst
    type: build
  - filename: snap-images/clinfo-wrapper.bst
    type: build
