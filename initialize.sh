name=$1
header=$name.h
header_def=$( echo $name\_h | tr -s  '[:lower:]'  '[:upper:]' )

if [ $# -eq 0 ]
then
	echo "Usage: sh initialize.sh [name]"
	exit 0
fi

mkdir $name
mkdir $name/srcs
mkdir $name/rsrcs
mkdir $name/includes

echo "#ifndef $header_def
# define $header_def

typedef struct		s_data	t_data;

struct						s_data
{
	// code
};

#endif" > $name/includes/$header

echo "#include \"$header\"

int		main(void)
{
	// code
	return (0);
}" > $name/srcs/main.c

echo "NAME = $name

CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRC = srcs/main.c \

OBJ = \$(SRC:.c=.o)

INCLUDES = includes/

all: \$(NAME)

\$(NAME):	\$(OBJ)
	\$(CC) \$(CFLAGS) -o \$(NAME) \$(OBJ) -I \$(INCLUDES)

%.o: %.c \$(INCLUDES)$header
	gcc -Wall -Wextra -Werror -o \$@ -c $< -I \$(INCLUDES)

clean:
	rm -f \$(OBJ)

fclean:		clean
	rm -f \$(NAME)

re:			fclean all" > $name/Makefile
