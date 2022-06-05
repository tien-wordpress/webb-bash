#!/usr/bin/env bash
setup_mailjet(){
  sudo apt install msmtp msmtp-mta -y
  printf "$(UI.Color.Blue)https://app.mailjet.com/signin$(UI.Color.Default)\n"
  printf "tiennv.ppe@gmail.com / Pa$$w0rd!\n"
  printf "tien.codeby@gmail.com / mmVT123!@#\n"
  printf "$(UI.Color.Blue)Add domain$(UI.Color.Default)\n"
  printf "https://app.mailjet.com/account/sender/domain\n"
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


printf '#! /usr/bin/php
<?php\n
ini_set( "display_errors", 1 );\n
error_reporting( E_ALL );\n
$from = "support@$DOMAIN";\n
$to = "123dinhcao@gmail.com";\n
$subject = "PHP Mail Test";\n
$message = "Testing PHP Mail functionality";\n
$headers = "From:" . $from;\n
mail($to,$subject,$message, $headers);\n
echo "Test email sent";\n
' >> /root/php_mail_test.php
/usr/local/lsws/lsphp80/bin/php /root/php_mail_test.php
}
# sudo chmod 600 .msmtprc

# defaults
# auth on
# tls on
# tls_trust_file /etc/ssl/certs/ca-certificates.crt
# account mail
# host in-v3.mailjet.com
# port 587
# from mail@webb.vn
# user 8b417b871e4cd4dcaca87d92be06b8a2
# password 38ca6ac0e5e2f9df865c68baa65f3683
# account default : mail


# sudo cp /root/.msmtprc /etc/msmtprc
# cd /etc
# sudo chown nobody msmtprc
# sudo chmod 600 msmtprc

# cd /usr/local/lsws/lsphp80/etc/php/8.0/litespeed/php.ini
# sudo nano php.ini
# sendmail_path = "/usr/bin/msmtp -C /etc/msmtprc -t"
# sudo /usr/local/lsws/bin/lswsctrl reload

# cd
# nano php_mail_test.php
# #! /usr/bin/php
# <?php
# ini_set( 'display_errors', 1 );
# error_reporting( E_ALL );
# $from = "mail@webb.vn";
# $to = "123dinhcao@gmail.com";
# $subject = "PHP Mail Test";
# $message = "Testing PHP Mail functionality";
# $headers = "From:" . $from;
# mail($to,$subject,$message, $headers);
# echo "Test email sent";

# sudo -u nobody /usr/local/lsws/lsphp80/bin/php php_mail_test.php
# }