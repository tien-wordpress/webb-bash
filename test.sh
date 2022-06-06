#!/bin/bash

printf -v wpconfig "define( 'MULTISITE', true );
define( 'MULTISITE', true );"

echo "1 $wpconfig"

# printf -v framename "define( 'MULTISITE', true );
# define( 'MULTISITE', true );"

# echo "2 $framename"