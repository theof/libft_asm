COMPILE.s= nasm -f macho64
MACOSX_DEPLOYMENT_TARGET=10.8.0
LDFLAGS= -lSystem $(FSANITIZE)

CC=clang

LIBFT=libfts.a
LIBFT_SRCDIR= src
LIBFT_SRC= $(addprefix $(LIBFT_SRCDIR)/, syscall.s ft_bzero.s)
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
