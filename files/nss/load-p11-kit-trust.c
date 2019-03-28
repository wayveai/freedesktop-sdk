#include <stdlib.h>
#include <p11-kit/p11-kit.h>
#include <dlfcn.h>

CK_RV
C_GetFunctionList(CK_FUNCTION_LIST_PTR_PTR list)
{
  CK_FUNCTION_LIST ** modules = NULL;
  CK_FUNCTION_LIST * m = NULL;
  char* filename = NULL;
  void* handle = NULL;
  CK_RV (*trust_C_GetFunctionList)(CK_FUNCTION_LIST_PTR_PTR);

  modules = p11_kit_modules_load(NULL, P11_KIT_MODULE_TRUSTED);
  if (!modules) {
    return CKR_LIBRARY_LOAD_FAILED;
  }

  m = p11_kit_module_for_name(modules, "p11-kit-trust");
  if (!m) {
    p11_kit_modules_release(modules);
    return CKR_LIBRARY_LOAD_FAILED;
  }

  filename = p11_kit_module_get_filename(m);
  if (!filename) {
    p11_kit_modules_release(modules);
    return CKR_LIBRARY_LOAD_FAILED;
  }

  handle = dlopen(filename, RTLD_NOW|RTLD_LOCAL);
  free(filename);
  if (!handle) {
    p11_kit_modules_release(modules);
    return CKR_LIBRARY_LOAD_FAILED;
  }
  trust_C_GetFunctionList = (CK_RV (*)(CK_FUNCTION_LIST_PTR_PTR))dlsym(handle, "C_GetFunctionList");
  if (!trust_C_GetFunctionList) {
    p11_kit_modules_release(modules);
    return CKR_LIBRARY_LOAD_FAILED;
  }

  return (*trust_C_GetFunctionList)(list);
}
