#include "miniunit.h"

#include "libasm.h"

TEST_CASE(normal) {
  char dest[100];
  char src[] = "hello world!";
  char* ret = ft_strcpy(dest, src);

  ASSERT(ret == dest, "strcpy must return the dest pointer");
  ASSERT(strcmp(ret, src) == 0, "strcpy failed with src: \"hello world!\" and dest[100]");
}

TEST_CASE(one_char) {
  char dest[100];
  char src[] = "a";
  char* ret = ft_strcpy(dest, src);

  ASSERT(ret == dest, "strcpy must return the dest pointer");
  ASSERT(strcmp(ret, src) == 0, "strcpy failed with src: \"a\" and dest[100]");
}

TEST_CASE(empty_string) {
  char dest[100];
  char src[] = "";
  char* ret = ft_strcpy(dest, src);

  ASSERT(ret == dest, "strcpy must return the dest pointer");
  ASSERT(strcmp(ret, src) == 0, "strcpy failed with src: \"\" and dest[100]");
}

TEST_MAIN {
  RUN_TEST(normal);
  RUN_TEST(one_char);
  RUN_TEST(empty_string);
  END();
}
