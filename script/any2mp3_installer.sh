#! /bin/bash
#
#	This script comes with no warranty. Use at own risk
#
#	This program is free software; you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation; version 3 of the License.
#
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with this program or from the site that you downloaded it
#	from; if not, write to the Free Software Foundation, Inc., 59 Temple
#	Place, Suite 330, Boston, MA  02111-1307   USA
#
#	GPL : http://www.gnu.org/copyleft/gpl.html
#
#	Script author : Renjith I S
#	Webpage : http://www.renjithis.in
#
#	You are free to modify this script and to make it better.
#	If you have done so and if you think you have made the script
#	better, please mail me a copy of it or make a pull-request in GitHub.
#	The comments provided in the script is for debugging and further development.
#	I would also appreciate any corrections and suggestions,
#	but i cant promise you that i would be able to implement it because of my
#	lack of knowledge in scripting.
#	Feel free to contact me for any information.
#
#	This script installs any2mp3 in your machine and make neccessary changes to make it work

SUCCESS=0
if [ $(which gksu) ]; then
  SUDO="gksu"
elif [ $(which kdesudo) ]; then
  SUDO="kdesudo"
elif [ $(which kdesu) ]; then
  SUDO="kdesu"
else
  SUDO="sudo"
fi

# tty -s; if [ $? -ne 0 ]; then xterm -e "$0"; exit; fi
# if [ ! "$(which zenity)" ]; then
#   echo
#   if [ "$(which software-properties-kde)" ]; then
#     sudo software-properties-kde --enable-component universe
#   fi
#   INSTALL_COMMAND=""
#   if [ $(which apt-get) ]; then
#     INSTALL_COMMAND="$SUDO apt-get update && $SUDO apt-get install -q -y zenity"
#   elif [ $(which yum) ]; then
#     INSTALL_COMMAND="$SUDO yum install zenity"
#   elif [ $(which pacman) ]; then
#     INSTALL_COMMAND="$SUDO pacman -U zenity"
#   fi
#   xterm -title 'Install zenity' -e "$INSTALL_COMMAND"
# fi
# 
# if [ ! "$(which zenity)" ]; then
#   xterm -title 'Unable to install zenity' -e "echo \"Please install zenity manually and run the script again.\" && read -sn 1-p \"Press any key to exit\""
#   SUCCESS=-1
#   exit 1
# fi
if [ ! "$(which mplayer)" ]; then
  echo
  INSTALL_COMMAND=""
  if [ $(which apt-get) ]; then
    INSTALL_COMMAND="$SUDO apt-get update && $SUDO apt-get install -q -y mplayer"
  elif [ $(which yum) ]; then
    INSTALL_COMMAND="$SUDO yum install mplayer"
  elif [ $(which pacman) ]; then
    INSTALL_COMMAND="$SUDO pacman -U mplayer"
  fi
  xterm -title 'Install mplayer' -e "$INSTALL_COMMAND"
fi
if [ ! "$(which lame)" ]; then
  echo
  INSTALL_COMMAND=""
  if [ $(which apt-get) ]; then
    INSTALL_COMMAND="$SUDO apt-get update && $SUDO apt-get install -q -y lame"
  elif [ $(which yum) ]; then
    INSTALL_COMMAND="$SUDO yum install lame"
  elif [ $(which pacman) ]; then
    INSTALL_COMMAND="$SUDO pacman -U lame"
  fi
  xterm -title 'Install LAME' -e "$INSTALL_COMMAND"
fi

if [ ! "$(which mplayer)" ]; then
  xterm -title 'Unable to install mplayer OR LAME' -e "echo \"Please install mplayer and LAME manually and run install the script again.\" && read -sn 1-p \"Press any key to exit\""
  SUCCESS=-1
  exit 1
fi
if [ ! "$(which lame)" ]; then
  xterm -title 'Unable to install LAME' -e "echo \"Please install LAME manually and run the install script again.\" && read -sn 1-p \"Press any key to exit\""
  SUCCESS=-1
  exit 1
fi

if [ -f ~/bin ]; then
  mkdir ~/bin
fi

cp any2mp3 ~/bin
