kind: autotools

depends: 
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  builddir: ""

config:
  configure-commands:
  - ./autogen.sh %{conf-args}

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libwebrtc_audio_processing.so"

sources: 
- kind: git
# Make this a reference back to the original repository when
# https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing/merge_requests/3
# is merged.
  url: freedesktop:lle-bout/webrtc-audio-processing.git
  track: add-ppc-family-support
  ref: 0aa8dd7496c5a91615e50f88e062ee0c89266d27
