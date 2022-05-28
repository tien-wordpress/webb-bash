#!/usr/bin/env bash
source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/lib/oo-bootstrap.sh"
import util/log
import util/tryCatch
import util/exception
import inits/wordpress

show_menus(){
  COLUMNS=$(tput cols)
  clear
  printf "WEBB.VN MENU\n"
  printf "\n"
  {
    printf "$(UI.Color.Yellow)WORDPRESS$(UI.Color.Default)\n"
    printf "1) Init wp-cli\n"
    printf "2) Add wordpress site\n"
    printf "3) Option 3\n"
    printf "4) Option 4\n"
    printf "$(UI.Color.Red)0) Exit$(UI.Color.Default)"
  } | pr -t2 -w "$COLUMNS"
}


read_options(){
  read -p "Enter choice: " choice
  case $choice in
    1) init_wpcli;;
    2) add_wpsite;;
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