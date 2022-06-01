#!/bin/bash
# sudo apt update
# sudo apt install -y jq
ufw allow 7080

rm -rf /root/webb-bash;
mkdir -p /root;
cd /root;
git clone https://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@github.com/tien-wordpress/webb-bash.git;
cd webb-bash;

echo 'alias webb="bash /root/webb-bash/menu.sh"' > ~/.bash_aliases;
source ~/.bash_aliases;

webb