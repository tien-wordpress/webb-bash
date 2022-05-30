get_lsws_info(){
  url="http://$(hostname -I | cut -d' ' -f1):7080/login.php"
  pass=`cat /root/.litespeed_password`

  printf "$(UI.Color.Yellow)LSWS info$(UI.Color.Default)\n"
  printf "url: $url\n"
  printf "user: admin\n"
  printf "pass: $pass\n"
  printf "js fix: sendCommand(SecurityInterstitialCommandId.CMD_PROCEED)"
}