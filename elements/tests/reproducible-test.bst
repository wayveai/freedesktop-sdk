kind: stack
description: Collection of things that reproducible test should run with

depends:
# All components
- platform.bst
- sdk.bst
- components.bst

# Base elements:
- components/avahi-base.bst
- components/cryptsetup-base.bst
- components/cups-base.bst
- components/dbus-base.bst
- components/flex-base.bst
- components/gstreamer-plugins-base.bst
- components/linux-pam-base.bst
- components/pipewire-base.bst
- components/pulseaudio-base.bst
- components/systemd-base.bst
- components/xdg-desktop-portal-base.bst

# Outputs
- flatpak-release-deps.bst
- oci/platform-oci.bst
- oci/sdk-oci.bst
- oci/flatpak-oci.bst
- oci/toolbox-oci.bst
# FIXME: Add snaps when we release
