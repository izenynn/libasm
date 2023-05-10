#include "miniunit.h"

#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <sys/errno.h>

#include "libasm.h"

int fd = -1;

// test normal behavior
TEST_CASE(file) {
  char *str = "Hello, world!";
  ssize_t bytes_written = ft_write(fd, str, strlen(str));
  ASSERT(bytes_written == (ssize_t)strlen(str), "wrong return value");
  close(fd);
}

// test error behavior - writing to a closed file descriptor should set errno to EBADF
TEST_CASE(closed_file) {
  close(fd);
  errno = 0; // reset errno
  char *str = "Hello, world!";
  ssize_t bytes_written = ft_write(fd, str, strlen(str));
  ASSERT(bytes_written == -1 && errno == EBADF, "writing to closed fd, return value and/or errno is not correct");
}

static bool open_testfile() {
  fd = open("testfile", O_CREAT | O_WRONLY, 0644);
  if (fd == -1) return (false);
  unlink("testfile");
  return (true);
}

TEST_MAIN {
  if (!open_testfile()) END();
  RUN_TEST(file);

  if (!open_testfile()) END();
  RUN_TEST(closed_file);

  END();
}
