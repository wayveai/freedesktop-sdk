kind: stack

public:
  bst:
    integration-commands:
      - |
        move_doc() {
          if [ -d "%{datadir}/${1}" ]; then
            mkdir -p "%{datadir}/runtime/docs/$(dirname "${2}")"
            mv "%{datadir}/${1}" "%{datadir}/runtime/docs/${2}"
            ln -s "%{datadir}/runtime/docs/${2}" "%{datadir}/${1}"
          fi
        }
        move_doc man man
        move_doc doc doc
        move_doc examples examples
        move_doc info info
        move_doc help help
        move_doc gtk-doc/html gtk-doc/html
        move_doc ri ri
        for cmakedir in "%{datadir}"/cmake-*; do
          basename="$(basename "${cmakedir}")"
          move_doc "${basename}/Help" "${basename}"
        done
