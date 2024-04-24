#!/usr/bin/env bash
var_time=1
clear
while true;do
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
	  "
echo " "
echo -n "Opção escolhida: "
read opcao
case $opcao in
        1)
                echo "Verificando por novas atualizações..."
                sleep $var_time
                apt update && apt upgrade -y
				freshclam
                ;;
        2)
                echo "Limpando e removendo pacotes desnecessários"
                sleep $var_time
                apt autoclean
				apt autoremove
                ;;
        3)
                echo "Desinstalando pacotes que não serão utilizados"
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
                echo "Instalando o antivirus Clam..."
				apt -y install clamav 
				apt -y install clamav-daemon
				apt -y install clamtk
				freshclam
                ;;
        5)
                echo "Instalando pacotes úteis"
                sleep $var_time
				apt install -y cups-pdf
				apt install -y wget 
				apt install -y gcc-9 
				apt install -y unzip 
				apt install -y libssl-dev 
				apt install -y software-properties-common
				add-apt-repository -y ppa:ubuntu-toolchain-r/test
				apt update && apt upgrade -y
				apt autoremove -y
				apt autoclean -y
                ;;
        6)
                echo "Instalando o Navegador Sankhya"
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
                echo "Definindo o papel de parede"
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
                echo "Parando a descoberta de impressoras"
                sleep $var_time
				chmod a-x /etc/init.d/avahi-daemon
				chmod a-x /etc/init.d/cups-browsed
				sed 's/^BrowseLocalProtocols.*$/BrowseLocalProtocols\ none/' -i /etc/cups/cupsd.conf
				service avahi-daemon stop
				service cups-browsed stop
                ;;
        0)
                echo Saindo do sistema...
                sleep $var_time
                exit 0
                ;;
        *)
                echo "Opção inválida, tente novamente!"
                ;;
esac
done