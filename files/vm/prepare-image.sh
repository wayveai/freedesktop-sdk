#!/bin/bash

set -eu

sysroot=
efipath=/efi
initial_scripts=/etc/fdsdk/initial_scripts
uuidnamespace="$(uuidgen -r)"

while [ $# -gt 1 ]; do
    param="$1"
    shift
    case "${param}" in
        --sysroot)
            sysroot="$1"
            shift
            ;;
        --initscripts)
            initial_scripts="$1"
            shift
            ;;
        --seed)
            uuidnamespace="$1"
            shift
            ;;
	--efipath)
	    efipath="$1"
	    shift
	    ;;
    esac
done

mkdir -p "${sysroot}/etc"

echo "Initial /etc/shells" 1>&2

cat >"${sysroot}/etc/shells" <<EOF
/bin/sh
/bin/bash
EOF

echo "Initial /etc/ld.so.conf" 1>&2

touch "${sysroot}/etc/ld.so.conf"

echo "Initial /etc/passwd and /etc/group" 1>&2

cat <<EOF >"${sysroot}/etc/passwd"
root:x:0:0:root:/root:/bin/bash
EOF

cat <<EOF >"${sysroot}/etc/group"
root:x:0:
EOF

for i in $(ls "${initial_scripts}"/*); do
    "${i}" "${sysroot}"
done

echo "Running systemd-firstboot" 1>&2
systemd-firstboot --root "${sysroot}" --root-password root --locale en_US.UTF-8 --timezone UTC

echo "Running systemctl preset-all" 1>&2
systemctl --root "${sysroot}" preset-all

echo "Fix rights for /etc/shadow" 1>&2
chmod 0400 "${sysroot}/etc/shadow"

echo "Creating /etc/fstab" 1>&2

uuid_root="$(uuidgen -s --namespace "${uuidnamespace}" --name root)"
id_efi="$(uuidgen -s --namespace "${uuidnamespace}" --name efi | tr a-f A-F | sed 's/^\(........\).*/\1/')"
uuid_efi="$(echo "${id_efi}" | sed 's/^\(....\)\(....\)$/\1-\2/')"

cat >"${sysroot}/etc/fstab" <<EOF
UUID=${uuid_root} / ext4 errors=remount-ro,relatime 0 1
UUID=${uuid_efi} ${efipath} vfat umask=0077 0 1
EOF

echo "uuid_root='${uuid_root}'"
echo "id_efi='${id_efi}'"
echo "uuid_efi='${uuid_efi}'"
