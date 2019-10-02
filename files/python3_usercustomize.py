from distutils import sysconfig
import site

site.addsitedir(sysconfig.get_python_lib(prefix='/app'))
