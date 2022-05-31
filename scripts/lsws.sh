get_lsws_info(){
  lswsAdminUrl="http://$(hostname -I | cut -d' ' -f1):7080/login.php"
  lswsAdminPass=`cat $SERVER_ROOT/.litespeed_password`
  printf "$(UI.Color.Yellow)LSWS info$(UI.Color.Default)\n"
  printf "$lswsAdminUrl\n"
  printf "$lswsAdminPass\n"
  printf "sendCommand(SecurityInterstitialCommandId.CMD_PROCEED)\n"
  printf " ---\n"

  phpMyAdminUrl="http://$(hostname -I | cut -d' ' -f1)/phpmyadmin"
  phpMyAdminPass==`cat $SERVER_ROOT/.db_password`
  printf "$phpMyAdminUrl\n"
  printf "$phpMyAdminPass\n"

  read -p "" fackEnterKey
}