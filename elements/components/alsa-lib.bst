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
    --with-pcm-plugins=all

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
  ref: v1.2.5.1-0-g054f0d2560b5a8bc16f8aa1b4b9b08ff6268522a
- kind: patch
  path: patches/alsa-lib/sysconfig-ostree.patch
