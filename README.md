# setup for Ubuntu 20.04
```
source <(curl -s https://raw.githubusercontent.com/tien-wordpress/webb-bash/main/init.sh)
```

find ./test.webb.vn/ -type f -exec sed -i '' 's#webb.vn#test.webb.vn#' * {} \;

find ./webb.vn -type f -exec sed -i '' 's#NEEDLE#REPLACEMENT#' * {} \;

grep -rl 'oranges' /usr/local/lsws/conf/vhosts/test.webb.vn
grep -rl 'webb.vn' /usr/local/lsws/conf/vhosts/test.webb.vn | xargs sed -i 's/webb.vn/oranges/g'

DOMAIN="aa.com"
sed -r "s/DOMAIN/$DOMAIN/" assets/cloudflare-record.txt