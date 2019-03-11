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
        %{bindir}/mandb --create
      fi

