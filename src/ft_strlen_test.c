#include "miniunit.h"

#include "libasm.h"

TEST_CASE(normal) {
  char s[] = "hello world!";
  ASSERT(ft_strlen(s) == 12, "wrong length returned for \"hello world!\"");
}
TEST_CASE(one_char) {
  char s[] = "a";
  ASSERT(ft_strlen(s) == 1, "wrong length returned for \"a\"");
}
TEST_CASE(empty_string) {
  char s[] = "";
  ASSERT(ft_strlen(s) == 0, "wrong length returned for \"\"");
}

TEST_MAIN {
  RUN_TEST(normal);
  RUN_TEST(one_char);
  RUN_TEST(empty_string);
  END();
}
