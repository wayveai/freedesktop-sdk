kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
- filename: base/python3.bst
- filename: base/gnupg.bst
- filename: base/curl.bst
- filename: base/openssl.bst
- filename: base/pcre2.bst
- filename: base/expat.bst
- filename: base/libffi.bst
- filename: base/gettext.bst
  type: build
- filename: base/tar.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build


variables:
  builddir: ''
  make: make %{make-args}
  make-install: make -j1 DESTDIR="%{install-root}" install %{make-args}
  make-args: |
    NO_TCLTK=YesPlease \
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
      for proto in http ftp ftps; do
        rm "%{install-root}%{libexecdir}/git-core/git-remote-${proto}"
        ln -s git-remote-https "%{install-root}%{libexecdir}/git-core/git-remote-${proto}"
      done

    - |
      rm "%{install-root}%{bindir}/git-shell"
      ln -s "$(realpath "%{install-root}%{libexecdir}/git-core/git" --relative-to="%{install-root}%{bindir}")" "%{install-root}%{bindir}/git-shell"

(@):
- elements/config/git.yml
