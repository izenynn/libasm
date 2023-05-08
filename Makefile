# **************************************************************************** #
#                                    NAME                                      #
# **************************************************************************** #

NAME = libasm.a

# **************************************************************************** #
#                                   COMPILER                                   #
# **************************************************************************** #

RM = rm -rf
MKDIR = mkdir

AR = ar
ARFLAGS = rcs

AS = nasm
ASFLAGS = -f macho64

CC = gcc
CPPFLAGS =
CFLAGS = -Wall -Wextra -Werror -Wpedantic -Wshadow -O2

CFLAGS += -I./include

# **************************************************************************** #
#                                    PATHS                                     #
# **************************************************************************** #

SRC_PATH := src
OBJ_PATH := obj

# **************************************************************************** #
#                                   SOURCES                                    #
# **************************************************************************** #

SRC_FILES := \
		ft_strlen.s		\

OBJ_FILES := $(patsubst %.s,%.o,$(patsubst %.c,%.o,$(SRC_FILES)))

SRC := $(addprefix $(SRC_PATH)/, $(SRC_FILES))
OBJ := $(addprefix $(OBJ_PATH)/, $(OBJ_FILES))

# **************************************************************************** #
#                                    RULES                                     #
# **************************************************************************** #

PHONY := all
all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.s | $(OBJ_PATH)
	$(AS) $(ASFLAGS) -o $@ $<

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c | $(OBJ_PATH)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

$(OBJ_PATH):
	$(MKDIR) $@

PHONY += clean
clean:
	$(RM) $(OBJ_PATH)

PHONY += fclean
fclean: clean
	$(RM) $(NAME)

PHONY += re
re: fclean all

.PHONY: $(PHONY)
