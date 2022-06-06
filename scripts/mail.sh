#!/usr/bin/env bash
setup_mailjet(){
  sudo apt install msmtp msmtp-mta -y
  printf "$(UI.Color.Blue)https://app.mailjet.com/signin$(UI.Color.Default)\n"
  printf "tiennv.ppe@gmail.com / Pa\$\$w0rd!\n"
  printf "tien.codeby@gmail.com / mmVT123!@#\n"
  printf "$(UI.Color.Blue)Add domain$(UI.Color.Default)\n"
  printf "https://app.mailjet.com/account/sender/domain\n"
  printf "$(UI.Color.Blue)Cloudflare$(UI.Color.Default)\n"
  printf "https://dash.cloudflare.com\n"
  printf "$(UI.Color.Blue)Api key$(UI.Color.Default)\n"
  printf "https://app.mailjet.com/account/apikeys\n"
  printf "$(UI.Color.Yellow)Domain (webb.vn):$(UI.Color.Default)"; read DOMAIN
  printf "$(UI.Color.Yellow)API KEY:$(UI.Color.Default)"; read API_KEY
  printf "$(UI.Color.Yellow)SECRET KEY:$(UI.Color.Default)"; read SECRET_KEY

printf "defaults\n
auth on\n
tls on\n
tls_trust_file /etc/ssl/certs/ca-certificates.crt\n
account mail\n
host in-v3.mailjet.com\n
port 587\n
from support@$DOMAIN\n
user $API_KEY\n
password $SECRET_KEY\n
account default : mail" >> /etc/msmtprc
sudo chown nobody /etc/msmtprc
sudo chmod 600 /etc/msmtprc
sed '/sendmail_path/a sendmail_path="/usr/bin/msmtp -C /etc/msmtprc -t"' /usr/local/lsws/lsphp80/etc/php/8.0/litespeed/php.ini
sudo /usr/local/lsws/bin/lswsctrl reload


printf "#! /usr/bin/php
<?php\n
ini_set('display_errors', 1 );\n
error_reporting( E_ALL );\n
\$from = 'support@$DOMAIN';\n
\$to = '123dinhcao@gmail.com';\n
\$subject = 'PHP Mail Test';\n
\$message = 'Testing PHP Mail functionality';\n
\$headers = 'From:' . \$from;\n
mail(\$to, \$subject, \$message, \$headers);\n
echo 'Test email sent';\n
" >> /root/php_mail_test.php
/usr/local/lsws/lsphp80/bin/php /root/php_mail_test.php

read -p "$(UI.Color.Blue)Enter to continue$(UI.Color.Default)" fackEnterKey
}