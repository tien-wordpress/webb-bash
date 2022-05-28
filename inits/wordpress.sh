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

add_wpsite_macos(){
  printf "$(UI.Color.Yellow)Domain (webb.vn):$(UI.Color.Default)"; read DOMAIN
  printf "$(UI.Color.Yellow)DB user (root):$(UI.Color.Default)"; read dbuser
  printf "$(UI.Color.Yellow)DB pass (root):$(UI.Color.Default)"; read dbpass
  DB="${DOMAIN/\./_}_db"
  wp core download --path=$DOMAIN --locale=en_US; cd $DOMAIN
  wp config create --dbname=$DB --dbuser=$dbuser --dbpass=$dbpass
  wp db create
  wp core install --url=$DOMAIN --title="$DOMAIN title" --admin_user=tienwp_asd --admin_password=tienwp_asd --admin_email=tien.wordpress@gmail.com
  read -p "" fackEnterKey
}

add_wpsite_ubuntu(){
  printf "$(UI.Color.Yellow)Domain (webb.vn):$(UI.Color.Default)"; read DOMAIN
  # printf "$(UI.Color.Yellow)DB user (root):$(UI.Color.Default)"; read dbuser
  # printf "$(UI.Color.Yellow)DB pass (root):$(UI.Color.Default)"; read dbpass

  string configTxt=`cat /var/www/html/wp-config.php`
  string dbuser=$($var:configTxt match 'DB_USER(.+)' 1)
  dbuser=`echo "${dbuser}" | head -1`
  dbuser=$($var:dbuser match '[a-zA-Z0-9]+' 0)

  string dbpass=$($var:configTxt match 'DB_PASSWORD(.+)' 1)
  dbpass=`echo "${dbpass}" | head -1`
  dbpass=$($var:dbpass match '[a-zA-Z0-9]+' 0)

  admin_password=$(String::GenerateUUID)
  admin_user="webb.vn"
  DB="${DOMAIN/\./_}_db"
  domainPath=/usr/local/lsws/$DOMAIN
  printf "\n"
  printf "$(UI.Color.Yellow)IMPORTANT$(UI.Color.Default)\n"
  printf "domain: $DOMAIN \n"
  printf "admin_user: $admin_user \n"
  printf "admin_password: $admin_password \n"
  printf "\n"
  printf "dbuser: $dbuser \n"
  printf "dbpass: $dbpass \n"
  printf "DB: $DB \n"
  printf "domainPath: $domainPath \n"
  printf "\n"
  read -p "$(UI.Color.Blue)Enter to continue$(UI.Color.Default)" fackEnterKey
  rm -rf $domainPath
  mkdir -p $domainPath/{conf,html,logs}
  wp core download --path=$domainPath/html --locale=en_US --allow-root; cd $domainPath/html
  wp config create --dbname=$DB --dbuser=$dbuser --dbpass=$dbpass --allow-root
  wp db drop --yes --allow-root
  wp db create --allow-root
  wp core install --url=$DOMAIN --title="$DOMAIN title" --admin_user=$admin_user --admin_password=$admin_password --admin_email=tien.wordpress@gmail.com --allow-root
  read -p "" fackEnterKey
}