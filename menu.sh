#!/usr/bin/env bash

COLUMNS=$(tput cols)

source "inits/wordpress.sh"

main_menu(){
    printf "    Webb.VN Menu\n"
    printf "\n"
  {
    printf "    1) Init wordpress\n"
    printf "    2) Option 2\n"
    printf "    3) Option 3\n"
    printf "    4) Option 4\n"
    printf "    5) Option 5\n"
    printf "    6) Option 6\n"
    printf "    7) Option 7\n"
    printf "    8) Option 8\n"
    printf "    9) Option 9\n"
    printf "    10) Option 10\n"
    printf "    11) Option 11\n"
    printf "    12) Option 12\n"
    printf "    13) Option 13\n"
    printf "    14) Option 14\n"
    printf "    15) Option 15\n"
    printf "    16) Option 16\n"
    printf "    17) Option 17\n"
    printf "    18) Option 18\n"
    printf "    19) Option 19\n"
    printf "    20) Option 20\n"
    printf "    21) Option 21\n"
    printf "    22) Option 22\n"
    printf "    23) Option 23\n"
    printf "    24) Option 24\n"
    } | pr -t2 -w "$COLUMNS"
    printf "\n"
    printf "    x) x to exit\n"
    printf "    Your choice: "
    read main

clear
while [[ "$main" != '\n' ]]; do
    if [[ "$main" = "\n" ]]; then
      exit;
    else
      case $main in
    1) init_wordpress; \\n ;;
    2) clear;
       opt_2;
        ;;
    3) clear;
       opt_3;
        ;;
    4) clear;
       opt_2;
        ;;
    x) clear;
      exit;
      ;;
      \\n) clear;
      exit;
      ;;
    *) clear;
      option_picked "Pick an option from the menu";
      main_menu;
      ;;
      esac
    fi
  done
}
option_picked(){
  message=(${@:-"Error: No message passed"})
    printf '%s\n' "${message[*]}"
}

main_menu