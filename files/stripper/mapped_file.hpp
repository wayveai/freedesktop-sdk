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
#ifndef MAPPED_FILE_HPP
#define MAPPED_FILE_HPP

#include "fd.hpp"
#include <sys/mman.h>

class mapped_file {
public:
  mapped_file(): mem(MAP_FAILED) {
  }

  explicit mapped_file(fd_t& fd);

  void const* ptr(std::size_t offset) const {
    return static_cast<char const*>(mem) + offset;
  }

  size_t get_size() const {
    return size;
  }

  ~mapped_file();

private:
  void *mem;
  size_t size;
};

#endif //MAPPED_FILE_HPP

