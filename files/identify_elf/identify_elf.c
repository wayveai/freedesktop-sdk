#include <elf.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stddef.h>
#include <unistd.h>
#include <sys/mman.h>

int main(int argc, char* argv[]) {
  int fd = -1;
  Elf64_Ehdr* header = NULL;
  Elf64_Half machine;

  fd = open(argv[1], O_RDONLY);
  if (fd == -1) {
    perror("identify-elf");
    goto fail;
  }
  header = (Elf64_Ehdr*)mmap(NULL, sizeof(Elf64_Ehdr),
			     PROT_READ, MAP_PRIVATE, fd, 0);
  if (header == NULL) {
    perror("identify-elf");
    goto fail;
  }
  machine = (header->e_ident[EI_DATA] == ELFDATA2MSB)?
    be16toh(header->e_machine):le16toh(header->e_machine);
  switch (machine) {
  case EM_AARCH64: {
    printf("aarch64-unknown-linux-gnu\n");
    break ;
  }
  case EM_386: {
    printf("i686-unknown-linux-gnu\n");
    break ;
  }
  case EM_ARM: {
    printf("arm-unknown-linux-gnueabihf\n");
    break ;
  }
  case EM_X86_64: {
    printf("x86_64-unknown-linux-gnu\n");
    break ;
  }
  case EM_PPC64: {
    if (header->e_ident[EI_DATA] == ELFDATA2MSB) {
      printf("powerpc64-unknown-linux-gnu\n");
    } else {
      printf("powerpc64le-unknown-linux-gnu\n");
    }
    break ;
  }
  default:
    fprintf(stderr, "Unknown architecture\n");
    goto fail;
  }
  munmap((void*)header, sizeof(Elf64_Ehdr));
  close(fd);
  return 0;
 fail:
  if (header != NULL) {
    munmap((void*)header, sizeof(Elf64_Ehdr));
  }
  if (fd != -1) {
    close(fd);
  }
  return 1;
}
