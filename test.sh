#!/usr/bin/env bash
source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/lib/oo-bootstrap.sh"
# import util/type
# import util/variable
import String/UUID
import String/SlashReplacement

String::GenerateUUID
echo 1
String::ReplaceSlashes "vn\com"