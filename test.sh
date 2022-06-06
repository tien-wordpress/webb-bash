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
define( 'MULTISITE', true );
define( 'SUBDOMAIN_INSTALL', false );
define( 'DOMAIN_CURRENT_SITE', '$DOMAIN' );
define( 'PATH_CURRENT_SITE', '/' );
define( 'SITE_ID_CURRENT_SITE', 1 );
define( 'BLOG_ID_CURRENT_SITE', 1 );
EOF
) -i z.txt

# sed '/^cdef$/r' <(printf "%s\n" line{1..4}) -i -- input.txt.