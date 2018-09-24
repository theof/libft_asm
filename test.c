#include <stdlib.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>

void	ft_bzero(void *s, size_t n);
char	*ft_strcat(char *restrict s1, const char *restrict s2);
int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_puts(const char *s);
size_t	ft_strlen(const char *s);
void	*ft_memset(void *b, int c, size_t len);
void	*ft_memcpy(void *restrict dst, const void *restrict src, size_t n);
char	*ft_strdup(const char *s1);
void	ft_cat(int fd);

/*
void	test_strlen(void)
{
	char const	*tests[] = {
		"",
		"abcd",
		"hello ceci est une grosse string\n"
	};

	for (int i = 0; i < sizeof(tests) / sizeof(*tests); i++)
		assert(strlen(tests[i]) == ft_strlen(tests[i]));
	fprintf(stdout, "test_strlen succeeded\n");
}
*/

static void	test_bzero(void)
{
	char	*str;
	size_t	n;
	char const	magic[] = "DEADBEEF";

	str = malloc(256);
	n = 0;
	while (n < 256)
	{
		memcpy(str + n, magic, 8);
		n += 8;
	}
	ft_bzero(str + 80, 60);
	n = 0;
	while (n < 256)
	{
		if (n >= 80 && n < 140)
			assert(str[n] == 0);
		else
			assert(str[n] == magic[n & 0x7]);
		n++;
	}
	ft_bzero(str, 0);
	assert(*str == 'D');
	ft_bzero(NULL, 0);
}

int		main(void)
{
	test_bzero();
}
