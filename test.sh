#!/usr/bin/env bash
source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/lib/oo-bootstrap.sh"
import util/type
import util/variable
import util/log


string configTxt=`cat inits/wp-config.php`
string dbuser=$($var:configTxt match 'DB_USER(.+)' 1)
dbuser=`echo "${dbuser}" | head -1`
dbuser=$($var:dbuser match '[a-zA-Z0-9]+' 0)
echo "dbuser: $dbuser"

string dbpass=$($var:configTxt match 'DB_PASSWORD(.+)' 1)
dbpass=`echo "${dbpass}" | head -1`
dbpass=$($var:dbpass match '[a-zA-Z0-9]+' 0)
echo "dbpass: $dbpass"
# head -n1 $dbuser
# echo "$dbuser"

# awk 'BEGIN {
#    arr[0] = "Three"
#    arr[1] = "One"
#    arr[2] = "Two"
#    print "Array elements before sorting:"

#    for (i in arr) {
#       print arr[i]
#    }
#    asort(arr)
#    print "Array elements after sorting:"

#    for (i in arr) {
#       print arr[i]
#    }
# }'

# # create a string someString
# string someString="My 123 Joe is 99 Mark"

# # saves all matches and their match groups for the said regex:
# # array matchGroups=$($var:someString getMatchGroups '([0-9]+) [a-zA-Z]+')

# # # lists all matches in group 1:
# # echo 1
# # $var:matchGroups every 2 1

# ## group 0, match 1
# echo 2
# $var:someString match '([0-9]+) [a-zA-Z]+' 1 1

# # calls the getter - here it prints the value
# echo 3
# $var:someString

# cat file | while read line
# do
#   echo "a line: $line"
# done

# content="`cat ./inits/wp-config.php`"
# echo $content