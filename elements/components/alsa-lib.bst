kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build
- filename: components/python3.bst
  type: build

variables:
  builddir: ''

  conf-local: |
    --disable-aload \
    --disable-alisp \
    --disable-old-symbols \
    --with-pythonlibs="-lpthread -lm -ldl -lpython3" \
    --with-pythonincludes=-I/usr/include/python3 \
    --with-pcm-plugins="hw ioplug extplug"

  local-config-replacement: |
    {
      @func concat
      strings [
        {
          @func getenv
          vars [ XDG_CONFIG_HOME ]
          default "~/.config"
        }
        "/asound.conf"
      ]
    }

config:
  install-commands:
    (>):
    - |
      cat >local-config-replacement <<\EOF
      %{local-config-replacement}
      EOF
      sed '\|"~/.asoundrc"|{
        x
        r local-config-replacement
      }' \
        "%{install-root}%{datadir}/alsa/alsa.conf" \
        >"%{install-root}%{datadir}/alsa/alsa-flatpak.conf"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libasound.so'
        - '%{libdir}/libatopology.so'

sources:
- kind: git_tag
  url: github:alsa-project/alsa-lib.git
  track: master
  ref: v1.2.1.2-0-g1c7e46d5d8bc3c213d7963056240b385f3d8727b
