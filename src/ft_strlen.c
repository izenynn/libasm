#include <stddef.h>

size_t ft_strlen(const char *s) {
	for (const char* char_ptr = s;; ++char_ptr) {
		if (*char_ptr == '\0') return char_ptr - s;
	}
}
