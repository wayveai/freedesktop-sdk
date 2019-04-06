import sys
import site
import os
import sysconfig
old_user_site = os.path.abspath(site.USER_SITE)

site.USER_SITE = None
site.USER_BASE = os.environ.setdefault("PYTHONUSERBASE", "/var/data/python")
sysconfig._CONFIG_VARS = None

site.USER_SITE = site.getusersitepackages()
old_index = sys.path.index(old_user_site)
sys.path.remove(old_user_site)
sys.path.insert(old_index, os.path.abspath(site.USER_SITE))
