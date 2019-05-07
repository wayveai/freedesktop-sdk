kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/perl.bst
- filename: components/python3.bst
- filename: components/gnupg.bst
- filename: components/curl.bst
- filename: components/pcre2.bst
- filename: components/expat.bst
- filename: components/libffi.bst
- filename: components/tar.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
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
