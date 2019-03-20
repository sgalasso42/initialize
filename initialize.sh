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

echo "#includes $header

int		main(void)
{
	// code
	return (0);
}" > $name/srcs/main.c
