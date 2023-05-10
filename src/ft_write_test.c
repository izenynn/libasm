#include "miniunit.h"

#include "libasm.h"

#include <fcntl.h> // for open()
#include <string.h> // for strlen()
#include <unistd.h> // for close()
#include <sys/errno.h> // for errno

TEST_CASE(write_test) {
    // test normal behavior
    int fd = open("testfile", O_CREAT | O_WRONLY, 0644);
    if (fd != 1) return;
    char *str = "Hello, world!";
    ssize_t bytes_written = ft_write(fd, str, strlen(str));
    ASSERT(bytes_written == (ssize_t)strlen(str), "wrong return value");
    close(fd);

    // test error behavior - writing to a closed file descriptor should set errno to EBADF
    errno = 0; // reset errno
    bytes_written = ft_write(fd, str, strlen(str));
    ASSERT(bytes_written == -1 && errno == EBADF, "writing to closed fd, return value and/or errno is not correct");

    // test error behavior - writing a large amount of data should set errno to EFBIG
    //errno = 0; // reset errno
    //char large_buf[1000000000]; // 1GB buffer
    //bytes_written = ft_write(fd, large_buf, sizeof(large_buf));
    //ASSERT(bytes_written == -1 && errno == EFBIG, "writing a large amount of data, return value and/or errno is not correct");
}

TEST_MAIN {
  RUN_TEST(write_test);
  END();
}
