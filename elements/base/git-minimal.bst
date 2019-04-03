kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/tar.bst
  type: build

variables:
  builddir: ''
  make: make %{make-args}
  make-install: make -j1 DESTDIR="%{install-root}" install %{make-args}
  make-args: |
    NO_TCLTK=YesPlease \
    NO_OPENSSL=YesPlease \
    NO_CURL=YesPlease \
    NO_GETTEXT=YesPlease \
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    prefix=%{prefix}

config:
  configure-commands: []

  install-commands:
    (>):
    - |
      find "%{install-root}" -type f -name perllocal.pod -delete

    - |
      inum="$(stat -c %i "%{install-root}%{bindir}/git")"
      find "%{install-root}" -inum "${inum}" -not -path "%{install-root}%{bindir}/git" -print0 | while read -d '' -r file; do
        rm "${file}"
        ln -s "$(realpath "%{install-root}%{bindir}/git" --relative-to="$(dirname "${file}")")" "${file}"
      done

    - |
      rm "%{install-root}%{bindir}/git-shell"
      ln -s "$(realpath "%{install-root}%{libexecdir}/git-core/git" --relative-to="%{install-root}%{bindir}")" "%{install-root}%{bindir}/git-shell"

(@):
- elements/config/git.yml
