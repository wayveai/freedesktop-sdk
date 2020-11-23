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
    name: "freedesktop-sdk-glxinfo-%{snap-branch}"
    version: "%{runtime-version}"
    summary: "glxinfo for Freedesktop SDK %{branch}"
    description: >-
      glxinfo provides information on available OpenGL devices. This
      is targeted to run on Freedesktop SDK runtime.  This application
      is meant for troubleshooting issues with OpenGL when using
      Freedesktop SDK runtime.
    type: app
    base: "freedesktop-sdk-runtime-%{snap-branch}"
    architectures:
      - "%{snap_arch}"
    confinement: strict
    grade: "%{snap_grade}"
    apps:
      glxinfo:
        command: glxinfo-wrapper
        plugs:
          - x11
          - opengl
          - wayland
    layout:
      /var/app:
        bind: $SNAP/app

depends:
  - filename: extensions/glxinfo/mesa-demos.bst
    type: build
  - filename: snap-images/glxinfo-wrapper.bst
    type: build
