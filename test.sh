#!/bin/bash

# printf -v wpconfig "define( 'MULTISITE', true );
# define( 'MULTISITE', true );"

# echo "1 $wpconfig"

# printf -v framename "define( 'MULTISITE', true );
# define( 'MULTISITE', true );"

# echo "2 $framename"

# sed '/WP_ALLOW_MULTISITE/r' <(
#   printf "define( 'MULTISITE', true );
# define( 'MULTISITE', true );") -- z.txt

sed '/WP_ALLOW_MULTISITE/r'<(cat <<EOF
line1
line2
line3
line4
EOF
) -i z.txt

# sed '/^cdef$/r' <(printf "%s\n" line{1..4}) -i -- input.txt.