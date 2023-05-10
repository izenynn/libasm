#include "miniunit.h"

#include "libasm.h"

TEST_CASE(equal) {
  ASSERT(ft_strcmp("", "") == 0, "failure with parameters: \"\", \"\"");
  ASSERT(ft_strcmp("a", "a") == 0, "failure with parameters: \"a\", \"a\"");
  ASSERT(ft_strcmp("aaa", "aaa") == 0, "failure with parameters: \"aaa\", \"aaa\"");
  ASSERT(ft_strcmp("hello world!",  "hello world!") == 0, "failure with parameters: \"hello world!\", \"hello world!\"");
}

TEST_CASE(less) {
  ASSERT(ft_strcmp("Aaa", "aaa")  < 0, "failure with parameters: \"Aaa\", \"aaa\"");
  ASSERT(ft_strcmp("aAa", "aaa")  < 0, "failure with parameters: \"aAa\", \"aaa\"");
  ASSERT(ft_strcmp("aaA", "aaa")  < 0, "failure with parameters: \"aaA\", \"aaa\"");
  ASSERT(ft_strcmp("aaa", "aaaB") < 0, "failure with parameters: \"aaa\", \"aaaB\"");
  ASSERT(ft_strcmp("aa" , "aaa")  < 0, "failure with parameters: \"aa\", \"aaa\"");
}

TEST_CASE(greater) {
  ASSERT(ft_strcmp("aaa" , "Aaa") > 0, "failure with parameters: \"aaa\", \"Aaaa\"");
  ASSERT(ft_strcmp("aaa" , "aAa") > 0, "failure with parameters: \"aaa\", \"aAa\"");
  ASSERT(ft_strcmp("aaa" , "aaA") > 0, "failure with parameters: \"aaa\", \"aaA\"");
  ASSERT(ft_strcmp("aaaB", "aaa") > 0, "failure with parameters: \"aaaB\", \"aaa\"");
  ASSERT(ft_strcmp("aaa" , "aa")  > 0, "failure with parameters: \"aaa\", \"aa\"");
}

TEST_CASE(empty) {
  ASSERT(ft_strcmp("" , "") == 0, "failure with parameters: \"\", \"\"");
  ASSERT(ft_strcmp("a", "")  > 0, "failure with parameters: \"a\", \"\"");
  ASSERT(ft_strcmp("" , "a") < 0, "failure with parameters: \"\", \"a\"");
}

TEST_MAIN {
  RUN_TEST(equal);
  RUN_TEST(less);
  RUN_TEST(greater);
  RUN_TEST(empty);
  END();
}
