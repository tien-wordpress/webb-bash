get_lsws_info(){
  url="http://$(hostname -I | cut -d' ' -f1):7080/login.php"
  pass=`cat /root/.litespeed_password`

  printf "$(UI.Color.Yellow)LSWS info$(UI.Color.Default)\n"
  printf "url: $url\n"
  printf "$pass\n"
  printf "sendCommand(SecurityInterstitialCommandId.CMD_PROCEED)"
  read -p "" fackEnterKey
}