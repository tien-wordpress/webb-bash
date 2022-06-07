#!/usr/bin/env bash

cd /root/webb-bash;
git pull;

echo 'alias webb="bash /root/webb-bash/menu.sh"' > ~/.bash_aliases;
source ~/.bash_aliases;

webb