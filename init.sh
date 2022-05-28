#!/bin/bash
rm -rf /var/www/webb-bash;

mkdir -p /var/www;
cd /var/www;
git clone https://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@github.com/tien-wordpress/webb-bash.git;
cd webb-bash;

echo 'alias webb="bash /var/www/webb-bash/menu.sh"' > ~/.bash_aliases;
source ~/.bash_aliases;

webb