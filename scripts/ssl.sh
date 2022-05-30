#!/usr/bin/env bash

init_ssl(){
  sudo apt install certbot -y
}

add_ssl_site(){
  printf "$(UI.Color.Yellow)SSL Domain (webb.vn):$(UI.Color.Default)"; read DOMAIN
  domainPath=/usr/local/lsws/$DOMAIN
  sudo certbot certonly --webroot -w $domainPath/html/ -d $DOMAIN <<<$(printf "tien.wordpress@gmail.com\nA\nn\n")
  printf "/etc/letsencrypt/live/$DOMAIN/fullchain.pem\n"
  printf "/etc/letsencrypt/live/$DOMAIN/privkey.pem\n"
  read -p "" fackEnterKey
}