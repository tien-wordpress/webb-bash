#!/usr/bin/env bash
# init_ols(){
#   wget https://raw.githubusercontent.com/litespeedtech/ols1clk/master/ols1clk.sh -P /root
#   chmod -R 775 /root/ols1clk.sh
#   bash /root/ols1clk.sh
#   read -p "" fackEnterKey
# }

# add_ols_wpsite(){
# ./ols1clk.sh -d test.webb.vn -w --wpuser admin --wppassword admin
# /bin/bash <( curl -sk https://raw.githubusercontent.com/litespeedtech/ls-cloud-image/master/Setup/vhsetup.sh ) -d www.example.com -le admin@example.com -f
# }

get_lsws_info(){
  lswsAdminUrl="http://$(hostname -I | cut -d' ' -f1):7080/login.php"
  lswsAdminPass=`cat /root/.litespeed_password`
  printf "$(UI.Color.Yellow)LSWS info$(UI.Color.Default)\n"
  printf "$lswsAdminUrl\n"
  printf "$lswsAdminPass\n"
  printf "sendCommand(SecurityInterstitialCommandId.CMD_PROCEED)\n"
  printf " ---\n"

  phpMyAdminUrl="http://$(hostname -I | cut -d' ' -f1)/phpmyadmin"
  phpMyAdminPass=`cat /root/.db_password`
  printf "$phpMyAdminUrl\n"
  printf "$phpMyAdminPass\n"

  read -p "" fackEnterKey
}


# sudo /usr/local/lsws/bin/lswsctrl reload
