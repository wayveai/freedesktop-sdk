import sys
import site
import os

old_user_site = os.path.abspath(site.USER_SITE)
try:
    old_index = sys.path.index(old_user_site)
except ValueError:
    # Unknon what causes this but let's not do anything if this happens
    pass
else:
    site.USER_BASE = os.environ.get("PYTHONUSERBASE", "/var/data/python")
    sys.path.remove(old_user_site)
    site.USER_SITE = None

    sys.path.insert(old_index, site.getusersitepackages())
