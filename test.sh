#!/bin/bash

my_function () {
  local func_result="some result"
  echo "$func_result"
}

func_result= printf "a
b
c"
echo "aa$func_result"

