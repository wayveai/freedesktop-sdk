include localedata/SUPPORTED

SUPPORTED:
	for locale in $(SUPPORTED-LOCALES); do \
	  echo "$${locale}" | sed "s,/, ,"; \
	done >"$@"
