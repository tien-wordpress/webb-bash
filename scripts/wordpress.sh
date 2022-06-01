#!/usr/bin/env bash
import util/type
import util/variable
import String/UUID

init_wpcli(){
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  php wp-cli.phar --info
  chmod +x wp-cli.phar
  sudo mv wp-cli.phar /usr/local/bin/wp
  read -p "" fackEnterKey
}

#add_wpsite_macos(){
#  printf "$(UI.Color.Yellow)Domain (webb.vn):$(UI.Color.Default)"; read DOMAIN
#  printf "$(UI.Color.Yellow)DB user (root):$(UI.Color.Default)"; read dbuser
#  printf "$(UI.Color.Yellow)DB pass (root):$(UI.Color.Default)"; read dbpass
#  DB="${DOMAIN/\./_}_db"
#  wp core download --path=$DOMAIN --locale=en_US; cd $DOMAIN
#  wp config create --dbname=$DB --dbuser=$dbuser --dbpass=$dbpass
#  wp db create
#  wp core install --url=$DOMAIN --title="$DOMAIN title" --admin_user=tienwp_asd --admin_password=tienwp_asd --admin_email=tien.wordpress@gmail.com
#  read -p "" fackEnterKey
#}


add_wpbase(){
  printf "DOMAIN: 123\n"
  printf "$(UI.Color.Yellow)Domain (webb.vn):$(UI.Color.Default)"; read DOMAIN
  add_wpsite_ubuntu $DOMAIN
  # DOMAIN="$(add_wpsite_ubuntu)"
  printf "DOMAIN 2: $DOMAIN\n"
  read -p "" fackEnterKey
}

add_wpsite_ubuntu(){
  local DOMAIN=$1
  printf "DOMAIN: $DOMAIN"
  string configTxt=`cat /var/www/html/wp-config.php`
  string dbuser=$($var:configTxt match 'DB_USER(.+)' 1)
  dbuser=`echo "${dbuser}" | head -1`
  dbuser=$($var:dbuser match '[a-zA-Z0-9]+' 0)
  printf "dbuser: $dbuser"
read -p "" fackEnterKey
return $DOMAIN
#   string dbpass=$($var:configTxt match 'DB_PASSWORD(.+)' 1)
#   dbpass=`echo "${dbpass}" | head -1`
#   dbpass=$($var:dbpass match '[a-zA-Z0-9]+' 0)

#   wppassword=$(String::GenerateUUID)
#   wpuser="webb.vn"
#   DB=${DOMAIN//[.]/_}
#   domainPath=/var/www/$DOMAIN
#   printf "\n"
#   printf "$(UI.Color.Yellow)IMPORTANT$(UI.Color.Default)\n"
#   printf "domain: $DOMAIN \n"
#   printf "wpuser: $wpuser \n"
#   printf "wppassword: $wppassword \n"
#   printf "\n"
#   printf "dbuser: $dbuser \n"
#   printf "dbpass: $dbpass \n"
#   printf "DB: $DB \n"
#   printf "domainPath: $domainPath \n"
#   printf "\n"
#   read -p "$(UI.Color.Blue)Enter to continue$(UI.Color.Default)" fackEnterKey

#   rm -rf $domainPath
#   mkdir -p $domainPath
#   wp core download --path=$domainPath --locale=en_US --allow-root; cd $domainPath
#   wp config create --dbname=$DB --dbuser=$dbuser --dbpass=$dbpass --allow-root
#   /bin/bash <( curl -sk https://raw.githubusercontent.com/litespeedtech/ls-cloud-image/master/Setup/vhsetup.sh ) -d $DOMAIN -le tien.wordpress@gmail.com -f
#   try {
#     wp db drop --yes --allow-root
#   } catch {}
#   wp db create --allow-root
#   wp core install --url=$DOMAIN --title="$DOMAIN title" --admin_user=$wpuser --admin_password=$wppassword --admin_email=tien.wordpress@gmail.com --allow-root
#   wp search-replace "http://$DOMAIN" "https://$DOMAIN" --allow-root
# #  wp plugin install https://github.com/nguyenshort/codeby-core/archive/refs/heads/master.zip --activate --allow-root
# #  wp plugin install https://downloads.wordpress.org/plugin/litespeed-cache.4.6.zip --activate --allow-root
# #  wp plugin install /root/webb-bash/assets/elementor-kit.zip --activate --allow-root
# #  wp plugin install /root/webb-bash/assets/elementor-pro-zalo-duy-riba.zip --activate --allow-root
#   wp config set FS_METHOD 'direct' --allow-root
#   chmod -R 777 $domainPath/wp-content
# #  read -p "" fackEnterKey
#   # return $DOMAIN
}

