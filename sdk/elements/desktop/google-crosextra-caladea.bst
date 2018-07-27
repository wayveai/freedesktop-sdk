kind: manual

depends:
  - filename: bootstrap-import.bst

variables:
  confdir: "%{install-root}/etc/fonts"

config:
  build-commands:
  - |
    make NAME=google-crosextra-caladea                  \
         PRIO=62                                        \
         EXTRA_CONFS=30-0-google-crosextra-caladea.conf \
         INSTALL_ROOT=%{install-root}

sources:
  - kind: tar
    url: https://gsdview.appspot.com/chromeos-localmirror/distfiles/crosextrafonts-20130214.tar.gz
    ref: c48d1c2fd613c9c06c959c34da7b8388059e2408d2bb19845dc3ed35f76e4d09
  - kind: local
    path: files/font-conf
    
