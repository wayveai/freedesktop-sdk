kind: autotools
description: jq JSON processor

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

config:
  configure-commands:
    (<) :
      - |
        cd modules/oniguruma
        autoreconf -v -f -i
        cd ../..

sources:
- kind: tar
  url: github_files:stedolan/jq/releases/download/jq-1.6/jq-1.6.tar.gz
  ref: 5de8c8e29aaa3fb9cc6b47bb27299f271354ebb72514e3accadc7d38b5bbaa72
