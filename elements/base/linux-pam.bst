kind: autotools

depends:
- filename: bootstrap-import.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build
- filename: base/flex.bst
  type: build
- filename: base/gettext.bst
  type: build

variables:
  conf-local: |
    --includedir="%{includedir}/security"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpam.so'
        - '%{libdir}/libpam_misc.so'
        - '%{libdir}/libpamc.so'

sources:
- kind: tar
  url: github_files:linux-pam/linux-pam/releases/download/v1.3.1/Linux-PAM-1.3.1.tar.xz
  ref: eff47a4ecd833fbf18de9686632a70ee8d0794b79aecb217ebd0ce11db4cd0db
