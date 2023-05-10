# **************************************************************************** #
#                                    NAME                                      #
# **************************************************************************** #

NAME = libasm.a
#NAME = libft.a

# **************************************************************************** #
#                                   COMPILER                                   #
# **************************************************************************** #

RM = rm -rf
MKDIR = mkdir
MAKE = make

AR = ar
ARFLAGS = rcs

AS = nasm
ASFLAGS = -f macho64

CC = gcc
CPPFLAGS =
CFLAGS = -Wall -Wextra -Werror -Wpedantic -Wshadow -O2

CFLAGS += -I./include

# **************************************************************************** #
#                                    DIRS                                      #
# **************************************************************************** #

SRC_DIR := src
OBJ_DIR := obj
INC_DIR := include

# **************************************************************************** #
#                                   SOURCES                                    #
# **************************************************************************** #

SRC_FILES := \
		ft_strlen.s		\
		ft_strcpy.s		\
		ft_strcmp.s		\
		ft_write.s		\
		ft_read.s		\
		ft_strdup.s		\

OBJ_FILES := $(patsubst %.s,%.o,$(patsubst %.c,%.o,$(SRC_FILES)))

SRC := $(addprefix $(SRC_DIR)/, $(SRC_FILES))
OBJ := $(addprefix $(OBJ_DIR)/, $(OBJ_FILES))

# **************************************************************************** #
#                                    TESTS                                     #
# **************************************************************************** #

TEST_DIR := mini-unit

TEST_SRC_FILES := \
		ft_strlen_test.c	\
		ft_strcpy_test.c	\
		ft_strcmp_test.c	\

TEST_SRC := $(addprefix $(SRC_DIR)/, $(TEST_SRC_FILES))

# **************************************************************************** #
#                                    RULES                                     #
# **************************************************************************** #

# all
SILENT := all
PHONY := all
all: $(NAME)

# name
$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

# obj
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s | $(OBJ_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

$(OBJ_DIR):
	$(MKDIR) $@

# tests
SILENT += test
PHONY += test
test:
	$(MAKE) -C $(TEST_DIR) SRC='$(SRC)' TEST_SRC='$(TEST_SRC)' RELATIVE_PATH='..' INCLUDES='$(INC_DIR)'

# utils
PHONY += clean
clean:
	$(MAKE) -C $(TEST_DIR) fclean
	$(RM) $(OBJ_DIR)

PHONY += fclean
fclean: clean
	$(RM) $(NAME)

PHONY += re
re: fclean all

.SILENT: $(SILENT)
.PHONY: $(PHONY)
