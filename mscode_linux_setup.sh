#!/bin/bash

#===================================#
# Visual Studio Code                #
# .desktop file and icon setup file #
#===================================#

# Variables
bitlength=$(getconf LONG_BIT)
os=$(uname)

# Perform prestart checks
function prestart {
  # Check for root
  if [[ $EUID -ne 0 ]]; then
     echo "We need root privileges to execute this script." 1>&2
     exit 1
  fi
  # Check for Linux
  if [[ $os != "Linux" ]]; then
    echo "This script currently does not support OSX." 1>&2
    echo "OSX should be added in the next patch" 1>&2
    exit 1
  fi
  # Check for 64-bit

  if [[ $bitlength -ne 64 ]]; then
    echo "Visual Studio Code is currently only 64-bit." 1>&2
    echo "The 32-bit hack is not currently supported." 1>&2
    exit 1
  fi
}

# Fetch archive
function fetch_archive {
  if [[ $os = "Linux" ]]; then
    wget -t0 http://go.microsoft.com/fwlink/?LinkID=534108
### OSX Install Fetch ###
# else
#   wget -t0 http://go.microsoft.com/fwlink/?LinkID=534108
  fi
}

# Create .desktop file
function make_desktop_file {
  echo '[Desktop Entry]' > ./code.desktop
  echo 'Type=Application' >> ./code.desktop
  echo 'Version=0.1.0' >> ./code.desktop
  echo 'Name=Code' >> ./code.desktop
  echo 'Comment=Visual Studio Code Editor' >> ./code.desktop
  echo 'Exec=code' >> ./code.desktop
  echo 'Icon=vso' >> ./code.desktop
  echo 'Terminal=false' >> ./code.desktop
  echo 'Categories=Programming;Development;' >> ./code.desktop
}

# Put files into appropriate folders
function move_files {
  mv ./code.desktop /usr/share/applications
  cp ./resources/app/vso.png /usr/share/icons/vso.png
}

# Exit cleanly
exit 0
