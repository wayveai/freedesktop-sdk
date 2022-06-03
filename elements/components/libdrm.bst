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

sources:
- kind: git_tag
  url: freedesktop:mesa/drm.git
  track: main
  ref: libdrm-2.4.111-0-gf801b07a60740425604d6563e5dc399375108bc4
