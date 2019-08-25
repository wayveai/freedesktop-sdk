kind: import
description: Import the base freedesktop SDK

(?):
- bootstrap_build_arch == "x86_64":
    sources:
    - kind: ostree
      url: freedesktop-sdk:releases/
      # Do not verify repo: Workaround for https://gitlab.com/BuildStream/buildstream/issues/524
      #gpg-key: keys/freedesktop-sdk.gpg
      track: runtime/org.freedesktop.Sdk.PreBootstrap/x86_64/18.08
      ref: d4aa8805ee9d8d00c0c419f262178f92e7e7d52370a61d32a6a2770c2958e9a1
- bootstrap_build_arch == "aarch64":
    sources:
    - kind: ostree
      url: freedesktop-sdk:releases/
      track: runtime/org.freedesktop.Sdk.PreBootstrap/aarch64/18.08
      ref: fe384a513a8e7a8e699a1f040c87fc689ec9226d13c73bcfc0dad84c48b5d1a3
- bootstrap_build_arch == "powerpc64le":
    sources:
    - kind: ostree
      url: freedesktop-sdk:releases/
      track: runtime/org.freedesktop.Sdk.PreBootstrap/ppc64le/19.08beta
      ref: f34548627cdb71d278862f61a63a30c34b632af8cabd37a55d6359aa478da355

config:
  source: files
  target: usr

public:
  bst:
    split-rules:
      filter:
      - "/usr/share/gnu-config/**"
