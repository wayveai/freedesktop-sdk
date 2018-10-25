# Generated man-db cache takes a lot of time. To avoid regenerating it
# too often, the integration commands for man-db are in this element.
kind: manual

depends:
- filename: bootstrap-import.bst
- filename: base/man-db.bst

public:
  bst:
    integration-commands:
    - |
      # This should not re-run on .Platform.
      if [ -f "%{sysconfdir}/man_db.conf" ]; then
        # Note that mandb mmap files which does not work yet with buildstream's SafeLinks mounts
        cp "%{sysconfdir}/man_db.conf" "%{sysconfdir}/man_db.conf.bak"
        sed -i "s,/var/cache,/tmp/cache," "%{sysconfdir}/man_db.conf"
        mkdir -p /tmp/cache
        %{bindir}/mandb --create
        mv "%{sysconfdir}/man_db.conf.bak" "%{sysconfdir}/man_db.conf"
        mkdir -p /var/cache
        rm -rf /var/cache/man
        mv /tmp/cache/man /var/cache/man
      fi

