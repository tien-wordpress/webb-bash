#!/bin/bash
init_wpcli(){
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  php wp-cli.phar --info
  chmod +x wp-cli.phar
  sudo mv wp-cli.phar /usr/local/bin/wp
  read -p "" fackEnterKey
}

add_wpsite(){
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