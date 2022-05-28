#!/usr/bin/env bash

# This cli tool requires bash >= 4. So, exit if the version of bash version is lower than 4.
if ((`bash -c 'IFS=.; echo "${BASH_VERSINFO[*]: 0:1}"'` < 4)); then
    echo "Sorry, you need at least bash version 4 to run this script."
    exit 1
fi;

## BOOTSTRAP ##
source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/lib/oo-bootstrap.sh"
import util/log
## MAIN ##
# import util/log util/exception util/tryCatch util/namedParameters util/class

## YOUR CODE GOES HERE ##

import util/tryCatch
import util/exception # needed only for Exception::PrintException
try {
    # something...
    cp ~/test ~/test2
    # something more...
} catch {
    echo "The hard disk is not connected properly!"
    echo "Caught Exception:$(UI.Color.Red) $__BACKTRACE_COMMAND__ $(UI.Color.Default)"
    echo "File: $__BACKTRACE_SOURCE__, Line: $__BACKTRACE_LINE__"
    Exception::PrintException "${__EXCEPTION__[@]}"
}