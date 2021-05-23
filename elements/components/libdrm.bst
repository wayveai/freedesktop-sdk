kind: meson
description: libdrm

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- bootstrap-import.bst
- components/xorg-lib-pciaccess.bst

variables:
  meson-local: |
    -Dintel=false \
    -Dradeon=false \
    -Damdgpu=false \
    -Dnouveau=false \
    -Dvmwgfx=false \
    -Domap=false \
    -Dexynos=false \
    -Dfreedreno=false \
    -Dtegra=false \
    -Dvc4=false \
    -Detnaviv=false \
    -Dudev=false

config:
  install-commands:
    (>):
    - |
      for f in "%{install-root}%{includedir}"/libdrm/*; do
        case "${f}" in
          */drm.h) ;&
          */drm_*.h)
            ;;
          */*_drm.h)
            rm "${f}"
            ;;
          *)
            echo "Not sure what to do with ${f}" 1>&2
            false
            ;;
        esac
      done

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdrm.so'
        - '%{libdir}/libkms.so'

sources:
- kind: git_tag
  url: freedesktop:mesa/drm.git
  # track: master # Updating only due to ABI issues
  ref: libdrm-2.4.105-0-g6b4e956d299c6ff09a4abf89642ccc1beb455c88
- kind: patch
  path: patches/libdrm/revert-abi-for-weston.patch
