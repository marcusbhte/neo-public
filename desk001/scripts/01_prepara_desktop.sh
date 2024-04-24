#!/usr/bin/env bash
##                          _____                     _             _        
##                         |_   _|                   | |           (_)      
##       _ __   ___  ___     | | ___  ___ _ __   ___ | | ___   __ _ _  __ _ 
##      | '_ \ / _ \/ _ \    | |/ _ \/ __| '_ \ / _ \| |/ _ \ / _` | |/ _` |
##      | | | |  __/ (_) |   | |  __/ (__| | | | (_) | | (_) | (_| | | (_| |
##      |_| |_|\___|\___/    \_/\___|\___|_| |_|\___/|_|\___/ \__, |_|\__,_|
##                                                             __/ |        
##                                                            |___/         
##                                                                          
## ---------------------------------------------
## Autor:      Marcus Almeida
## Data:       24/04/2024 
## Finalidade: Laboratório Metabase sobre Docker
## ---------------------------------------------
## SO:         Linux Ubuntu 22.04 LTS
## Machine:    neoserver
## Usuário:    
## Senha:      
## UserMetabs: atendimento@neo.tec.br
## ---------------------------------------------
## Aplicações:
## 
# +-----------------------------------------------------------------------+
var_time=1
clear
while true;do
echo " "
echo "                          _____                     _             _       "
echo "                         |_   _|                   | |           (_)      "
echo "       _ __   ___  ___     | | ___  ___ _ __   ___ | | ___   __ _ _  __ _ "
echo "      | '_ \ / _ \/ _ \    | |/ _ \/ __| '_ \ / _ \| |/ _ \ / _` | |/ _` |"
echo "      | | | |  __/ (_) |   | |  __/ (__| | | | (_) | | (_) | (_| | | (_| |"
echo "      |_| |_|\___|\___/    \_/\___|\___|_| |_|\___/|_|\___/ \__, |_|\__,_|"
echo "                                                             __/ |        "
echo "                                                            |___/         "
echo " "
echo "SEJA BEM VINDO AO $0 DO UBUNTU!"
echo " "
echo "Escolha uma opção:
	0 - Sair do sistema
	1 - Instalar atualizações do sistema [ root ]
	2 - Limpa e remove pacotes desnecessários [ root ]
	3 - Remove os apps desnecessários [ root ]
	4 - Instala o antivirus Clam [ root ]
	5 - Instala pacotes úteis [ root ]
	6 - Instala/Atualiza o Navegador Sankhya [ user ]
	7 - Definir o papel de parede institucional [ user ]
	8 - Para a descoberta de impressoras [ root ]
	9 - Instalar o RealVNC (Opcional) [ root ]"
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
				clear
                echo "Verificando por novas atualizações..."
				echo ""
				echo "------------------------------------------------------"
                sleep $var_time
                apt update && apt upgrade -y
				freshclam
                ;;
        2)
				clear
                echo "Limpando e removendo pacotes desnecessários"
				echo ""
				echo "------------------------------------------------------"
                sleep $var_time
                apt autoclean
				apt autoremove
                ;;
        3)
				clear
                echo "Desinstalando pacotes que não serão utilizados"
				echo ""
				echo "------------------------------------------------------"
                sleep $var_time
                apt purge -y libreoffice*
				apt purge -y pix 
				apt purge -y gimp 
				apt purge -y hexchat 
				apt purge -y transmission 
				apt purge -y xplayer 
				apt purge -y rhythmbox 
				apt purge -y simple-scan 
				apt purge -y celluloid 
				apt purge -y drawing 
				apt purge -y hypnotix 
				# apt purge -y vlc
				apt purge -y transmission-gtk
                apt autoclean
				apt autoremove
                ;;
        4)
				clear
                echo "Instalando o antivirus Clam..."
				echo ""
				echo "------------------------------------------------------"
				apt -y install clamav 
				apt -y install clamav-daemon
				apt -y install clamtk
				freshclam
                ;;
        5)
				clear
                echo "Instalando pacotes úteis"
				echo ""
				echo "------------------------------------------------------"
                sleep $var_time
				apt install -y cups-pdf
				apt install -y wget 
				apt install -y tasksel 
				apt install -y gcc-9 
				apt install -y unzip 
				apt install -y libssl-dev 
				apt install -y software-properties-common
				add-apt-repository -y ppa:ubuntu-toolchain-r/test
				apt update && apt upgrade -y
				apt autoremove -y
				apt autoclean -y
				tasksel install ssh-server
                ;;
        6)
				clear
                echo "Instalando o Navegador Sankhya"
				echo ""
				echo "------------------------------------------------------"
                sleep $var_time
				cd ~/
				mkdir Sankhya
				cd Sankhya
				rm -r Navegador_Sankhya*
				rm NavegadorSankhya*
				wget https://grfetvhg7pdl.compat.objectstorage.sa-saopaulo-1.oraclecloud.com/navegador-sankhya/NavegadorSankhya_1.3b370_linuxx64.tar.gz
				tar -xvzf *.tar.gz
				mv Navegador_Sankhya-1.3b370/ Navegador_Sankhya
				cd ~/
				cd Área\ de\ Trabalho/
				rm Sankhya 
				echo "#!/bin/bash
				cd ~/Sankhya/Navegador_Sankhya/
				./execNavegadorSankhya" >> Sankhya
				chmod +x Sankhya
                ;;
        7)
				clear
                echo "Definindo o papel de parede"
				echo ""
				echo "------------------------------------------------------"
                sleep $var_time
				cd ~/
				cd Sankhya
				mkdir wallpaper/
				cd wallpaper/
				rm wallpaper.jpg
				wget https://raw.githubusercontent.com/marcusbhte/neo-public/76d9fc67e086501cc47b719aa52570157e8bc21d/desk001/wallpaper/wallpaper.jpg
				WALLPAPERS="$HOME/Sankhya/wallpaper" #coloque aqui a localização das imagens.
				ALIST=( `ls -w1 $WALLPAPERS` )
				RANGE=${#ALIST[@]}
				let "number = 0"
				let LASTNUM="`cat $WALLPAPERS/.last` + 1"
				let "number = $LASTNUM % $RANGE"
				echo $number > $WALLPAPERS/.last
				#
				if [ $number -gt $RANGE ];then
				  number=1
				fi
				#
				gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPERS/${ALIST[$number]}"
                ;;
        8)
				clear
                echo "Parando a descoberta de impressoras"
				echo ""
				echo "------------------------------------------------------"
                sleep $var_time
				chmod a-x /etc/init.d/avahi-daemon
				chmod a-x /etc/init.d/cups-browsed
				sed 's/^BrowseLocalProtocols.*$/BrowseLocalProtocols\ none/' -i /etc/cups/cupsd.conf
				service avahi-daemon stop
				service cups-browsed stop
                ;;
        9)
				clear
                echo "Instalando o RealVNC Server"
				echo ""
				echo "------------------------------------------------------"
                sleep $var_time
				# Uninstall and Stop X11VNC service
				apt purge x11vnc -y
				service x11vnc stop
				apt autoremove -y
				apt autoclean -y
				# Download and unpack the latest binary on a 64-bit Debian-compatible system:
				# curl -L -o VNC https://www.realvnc.com/connect/download/binary/latest/debian/32-bit/
				curl -L -o VNC https://www.realvnc.com/connect/download/binary/latest/debian/64-bit/
				# Install VNC Server on a Debian-compatible system (assuming download file named as above):
				dpkg -i VNC
				rm VNC
				# Apply your license key, available from the Deployment page of your RealVNC account:
				# vnclicense -add 
				# Custom Settings
				rm /etc/vnc/config.d/common.custom
				echo "#Custom Settings" >> /etc/vnc/config.d/common.custom
				echo "Encryption=AlwaysOff" >> /etc/vnc/config.d/common.custom
				echo "Authentication=VncAuth" >> /etc/vnc/config.d/common.custom
				echo "ConnNotifyTimeout=0" >> /etc/vnc/config.d/common.custom
				echo "DisableTrayIcon=1" >> /etc/vnc/config.d/common.custom
				echo "EnableRemotePrinting=false" >> /etc/vnc/config.d/common.custom
				echo "EnableAutoUpdateChecks=false" >> /etc/vnc/config.d/common.custom
				echo "EnableManualUpdateChecks=false" >> /etc/vnc/config.d/common.custom
				# Specify a VNC password for VNC Server in Service Mode:
				vncpasswd -service 
				# Mark or unmark the service to be started at boot time with:
				systemctl enable vncserver-x11-serviced.service
				# Start VNC Server on a Linux system using systemd:
				systemctl start vncserver-x11-serviced.service
				# Show Status
				systemctl status vncserver-x11-serviced.service
                ;;
        0)
				clear
                echo "Saindo do sistema..."
                sleep $var_time
                exit 0
                ;;
        *)
                echo "Opção inválida, tente novamente!"
                ;;
esac
done