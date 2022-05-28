#!/bin/bash
init_wpcli(){
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  php wp-cli.phar --info
  chmod +x wp-cli.phar
  sudo mv wp-cli.phar /usr/local/bin/wp
}

add_site(){
  printf  "$(UI.Color.Yellow)Domain (webb.vn): "; read DOMAIN
  wp core download --path=$DOMAIN --locale=en_US; cd $DOMAIN
  wp config create --dbname=$DOMAIN --dbuser=root --dbpass=
  wp db create
  wp core install --url=wpdemo.dev --title="WP-CLI" --admin_user=tienwp_asd --admin_password=tienwp_asd --admin_email=tien.wordpress@gmail.com
}