#!/usr/bin/env bash
source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/lib/oo-bootstrap.sh"
import util/log
import util/tryCatch
import util/exception
import scripts/wordpress
import scripts/ssl
import scripts/lsws
import scripts/mail

show_menus(){
  COLUMNS=$(tput cols)
  clear
  printf "$(UI.Color.Blue)WEBB.VN MENU$(UI.Color.Default)\n"
  printf "\n"

  printf "$(UI.Color.Yellow)WORDPRESS$(UI.Color.Default)\n"
  {
    printf "11) Init wp-cli\n"
    printf "12) Add Wordpress Base (News, Blog)\n"
    printf "13) Add Wordpress Multiple\n"
  } | pr -t2 -w "$COLUMNS"

#  printf "$(UI.Color.Yellow)SSL$(UI.Color.Default)\n"
#  {
#    printf "21) Init ssl\n"
#    printf "22) Add ssl site\n"
#  } | pr -t2 -w "$COLUMNS"

  printf "$(UI.Color.Yellow)LSWS$(UI.Color.Default)\n"
  {
#    printf "31) Init ols\n"
    printf "32) Info lwsw\n"
  } | pr -t2 -w "$COLUMNS"

  printf "$(UI.Color.Yellow)Mail$(UI.Color.Default)\n"
  {
#    printf "31) Init ols\n"
    printf "41) Setup Mailjet\n"
  } | pr -t2 -w "$COLUMNS"

  printf "$(UI.Color.Red)0) Exit$(UI.Color.Default)\n"
}


read_options(){
  read -p "Enter choice: " choice
  case $choice in
    11) init_wpcli;;
    12) add_wpbase;;
    13) add_wpmulti;;
    32) get_lsws_info;;
    41) setup_mailjet;;
    0) exit 0;;
    *) printf "$(UI.Color.Red)Error...$(UI.Color.Default)" && sleep 2
  esac
}

try {
  while true
  do
    show_menus
    read_options
  done
} catch {
    echo "Caught Exception:$(UI.Color.Red) $__BACKTRACE_COMMAND__ $(UI.Color.Default)"
    echo "File: $__BACKTRACE_SOURCE__, Line: $__BACKTRACE_LINE__"
    Exception::PrintException "${__EXCEPTION__[@]}"
    read -p "" fackEnterKey
}