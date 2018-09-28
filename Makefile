COMPILE.s= nasm -g -f macho64
MACOSX_DEPLOYMENT_TARGET=10.8.0
LDFLAGS= -lSystem $(FSANITIZE) -g

CC=clang

LIBFT=libfts.a
LIBFT_SRCDIR= src
LIBFT_SRC_NAMES = syscall.s ft_bzero.s ft_strcat.s ft_isalpha.s ft_isupper.s ft_islower.s ft_isdigit.s ft_isalnum.s ft_isprint.s ft_toupper.s ft_tolower.s ft_isascii.s ft_strlen.s ft_puts.s ft_memset.s
LIBFT_SRC= $(addprefix $(LIBFT_SRCDIR)/, $(LIBFT_SRC_NAMES))
LIBFT_OBJ= $(LIBFT_SRC:%.s=%.o)

TEST_SRC= test.c
TEST_OBJ= $(TEST_SRC:%.c=%.o)
TEST= test

all: $(LIBFT) $(TEST)

$(LIBFT): $(LIBFT_OBJ)
	$(AR) rcs $@ $^

$(TEST_OBJ): $(TEST_SRC) libfts.h
	MACOSX_DEPLOYMENT_TARGET=$(MACOSX_DEPLOYMENT_TARGET) $(CC) $(FSANITIZE) -c $(TEST_SRC)

$(TEST): $(TEST_OBJ) $(LIBFT)
	clang $(LDFLAGS) -o $@ $^

check: $(TEST)
	./$(TEST)

clean:
	rm -f $(LIBFT_OBJ) $(TEST_OBJ)

fclean: clean
	rm -f $(LIBFT) $(TEST)

re:
	$(MAKE) fclean
	$(MAKE)

.PHONY: clean fclean re check
