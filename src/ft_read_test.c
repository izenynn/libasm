#include "miniunit.h"

#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <sys/errno.h>

#include "libasm.h"

int fd = -1;
char buf[20] = {0};

// test normal behavior
TEST_CASE(read_test) {
    ssize_t bytes_read = ft_read(fd, buf, sizeof(buf) - 1);
    // it should read the amount of bytes or less, depending on the file size
    ASSERT(bytes_read >= 0, "wrong return value");
    close(fd);
}

// test error behavior - reading from a closed file descriptor should set errno to EBADF
TEST_CASE(closed_file) {
    close(fd);
    errno = 0; // reset errno
    ssize_t bytes_read = ft_read(fd, buf, sizeof(buf) - 1);
    ASSERT(bytes_read == -1 && errno == EBADF, "reading to closed fd, return value and/or errno is not correct");
}

static bool open_testfile() {
  fd = open("testfile", O_CREAT | O_RDONLY, 0644);
  if (fd == -1) return (false);
  unlink("testfile");
  write(fd, "abcdefghijklmnopqrstuvwxyz", 26);
  return (true);
}

TEST_MAIN {
  if (!open_testfile()) END();
  RUN_TEST(read_test);

  if (!open_testfile()) END();
  RUN_TEST(closed_file);

  END();
}
