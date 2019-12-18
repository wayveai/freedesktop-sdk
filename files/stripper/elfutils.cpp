/*
 * Copyright (c) 2019 Codethink Ltd.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
#include "elfutils.hpp"

known_arch get_arch(Elf32_Ehdr const* header) {
  auto machine = (header->e_ident[EI_DATA] == ELFDATA2MSB)?
    be16toh(header->e_machine):le16toh(header->e_machine);
  switch (machine) {
  case EM_AARCH64:
    return known_arch::aarch64;
  case EM_386:
    return known_arch::i686;
  case EM_ARM:
    return known_arch::arm;
  case EM_X86_64:
    return known_arch::x86_64;
  case EM_PPC64:
    if (header->e_ident[EI_DATA] == ELFDATA2MSB)
      return known_arch::unknown;
    else
      return known_arch::ppc64le;
  }
  return known_arch::unknown;
}

bool has_debuglink(fd_t& fd) {
  {
    mapped_file m(fd);
    auto header = static_cast<Elf32_Ehdr const*>(m.ptr(0));

    if (header->e_ident[EI_CLASS] == ELFCLASS32) {
      return has_debuglink(m, header);
    } else if (header->e_ident[EI_CLASS] != ELFCLASS64) {
      return false;
    }
  }
  mapped_file m(fd);
  auto header = static_cast<Elf64_Ehdr const*>(m.ptr(0));

  return has_debuglink(m, header);
}
