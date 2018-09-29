# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tvallee <tvallee@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/09/29 19:46:40 by tvallee           #+#    #+#              #
#    Updated: 2018/09/29 19:49:07 by tvallee          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPILE.s= nasm -g -f macho64
OSX_TARGET=10.8.0
LDFLAGS= -lSystem $(FSANITIZE) -g

CC=clang

LIBFT=libfts.a
LIBFT_SRCDIR= src
LIBFT_SRC_NAMES  = ft_cat.s ft_bzero.s ft_strcat.s ft_isalpha.s ft_isupper.s
LIBFT_SRC_NAMES += ft_islower.s ft_isdigit.s ft_isalnum.s ft_isprint.s
LIBFT_SRC_NAMES += ft_toupper.s ft_tolower.s ft_isascii.s ft_strlen.s ft_puts.s
LIBFT_SRC_NAMES += ft_memset.s ft_memcpy.s ft_strdup.s
LIBFT_SRC= $(addprefix $(LIBFT_SRCDIR)/, $(LIBFT_SRC_NAMES))
LIBFT_OBJ= $(LIBFT_SRC:%.s=%.o)

TEST_SRC= test.c
TEST_OBJ= $(TEST_SRC:%.c=%.o)
TEST= test

all: $(LIBFT) $(TEST)

$(LIBFT): $(LIBFT_OBJ)
	$(AR) rcs $@ $^

$(TEST_OBJ): $(TEST_SRC) libfts.h
	MACOSX_DEPLOYMENT_TARGET=$(OSX_TARGET) $(CC) $(FSANITIZE) -g -c $(TEST_SRC)

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
