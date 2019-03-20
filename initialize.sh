name=$1

if [ $# -eq 0 ]
then
	echo "Usage: sh initialize.sh [name]"
	exit 0
fi

mkdir $name
mkdir $name/srcs
mkdir $name/rsrcs
mkdir $name/includes

echo "#ifndef $name
# define $name

typedef struct		s_data	t_data;

struct						s_data
{
	// code
};

#endif" > $name/includes/$name.h

echo "#includes $name.h

int		main(void)
{
	// code
	return (0);
}" > $name/srcs/main.c
