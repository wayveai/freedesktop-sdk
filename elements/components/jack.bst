kind: manual

depends:
- bootstrap-import.bst
- components/sndfile.bst
- components/alsa-lib.bst

build-depends:
- components/python3.bst
- components/systemd.bst
- components/pkg-config.bst

environment:
  JOBS: "%{max-jobs}"

environment-nocache:
- JOBS

variables:
  config: >-
    --prefix="%{prefix}"
    --bindir="%{bindir}"
    --libdir="%{libdir}"
    --mandir="%{mandir}"
    --systemd-unit
    --systemd=yes
    --db=no
    --alsa=yes
    --firewire=no
    --iio=no
    --sndfile=yes
    --readline=yes
    --enable-pkg-config-dbus-service-dir

config:
  configure-commands:
  - |
    python3 waf configure %{config}

  build-commands:
  - |
    python3 waf -j ${JOBS} build

  install-commands:
  - |
    python3 waf install --destdir="%{install-root}"

sources:
- kind: git_tag
  url: github:jackaudio/jack2.git
  track: master
  ref: v1.9.17-0-g9e23888b8def6527774889cf4ef6348fb78c7154
