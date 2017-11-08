kind: myautotools

depends:
  - filename: base-stack.bst
    type: build

variables:
  max-jobs: 1

sources:
  - kind: tar
    url: http://freedesktop.org/~hadess/shared-mime-info-1.9.tar.xz
    ref: 5c0133ec4e228e41bdf52f726d271a2d821499c2ab97afd3aa3d6cf43efcdc83
