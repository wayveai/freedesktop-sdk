kind: script
depends:
  - filename: bootstrap-import.bst
    type: build
  - filename: snap-images/snap-image.bst
    type: build

variables:
  install-root: /buildstream-install

config:
  layout:
    - element: bootstrap-import.bst
      destination: /
    - element: snap-images/snap-image.bst
      destination: "%{install-root}"

  commands:
    - |
      for dir in snap tmp writeable dev etc home root           \
                 proc sys run lib media                         \
                 var/snap var/lib/snapd var/tmp var/log         \
                 lib/modules usr/src usr/lib/snapd              \
                 mnt var/lib/extrausers
      do
        mkdir -p "%{install-root}/${dir}"
      done

    - |
      rm "%{install-root}/usr/bin/sh"
      ln -s dash "%{install-root}/usr/bin/sh"
