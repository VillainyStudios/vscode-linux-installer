#!/bin/bash

#===================================#
# Visual Studio Code                #
# .desktop file and icon setup file #
#===================================#

# Check for root
if [[ $EUID -ne 0 ]]; then
   echo "We need root privileges to execute this script." 1>&2
   exit 1
fi

# Create .desktop file
echo '[Desktop Entry]' > ./code.desktop
echo 'Type=Application' >> ./code.desktop
echo 'Version=0.1.0' >> ./code.desktop
echo 'Name=Code' >> ./code.desktop
echo 'Comment=Visual Studio Code Editor' >> ./code.desktop
echo 'Exec=code' >> ./code.desktop
echo 'Icon=vso' >> ./code.desktop
echo 'Terminal=false' >> ./code.desktop
echo 'Categories=Programming;Development;' >> ./code.desktop

# Put files into appropriate folders
mv ./code.desktop /usr/share/applications
cp ./resources/app/vso.png /usr/share/icons/vso.png

# Exit cleanly
exit 0
