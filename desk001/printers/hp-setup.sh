#!/bin/sh
# Desativa a descoberta de impressoras
systemctl stop cups-browsed
# boner#1135
wget https://ufpr.dl.sourceforge.net/project/hplip/hplip/3.21.8/hplip-3.21.8.run -O hplip.run
chmod +x hplip.run
./hplip.run
# hp-setup
# hp-setup -i