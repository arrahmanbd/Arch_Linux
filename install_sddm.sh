#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
  echo -e "\e[1;31mYou need to run this script as root (sudo).\e[0m"
  exit 1
fi

src_dir="ArchHacker"
dest_dir="/usr/share/sddm/themes"
config_dir="/etc/sddm.conf"
# Check if the source directory exists
if [[ ! -d "$src_dir" ]]; then
  echo -e "\e[1;31mSource directory '$src_dir' does not exist.\e[0m"
  exit 1
fi

# Move the directory to the destination
mv "$src_dir" "$dest_dir"
if [[ $? -eq 0 ]]; then
  echo -e "\e[1;33mSuccess!\e[0m"

  read -p "Want to set this theme? (yes/no): " choice
  if [[ "$choice" == "yes" ]]; then
    # Do additional actions here if the user chooses "yes"
    echo "Performing additional actions..."
    # Replace the text after "Current=" with "ArchHacker" in the file
   #sed 's/\(Current=\).*/\1'"$src_dir"'/g' "$config_dir"
    sed -i 's/\(Current=\).*/\1ArchHacker/g' "$config_dir"
    # Example: Run a command or perform configuration changes
    # Replace the following line with the desired action
    echo -e "\e[1;35mTheme set successfully!\e[0m"
  else
    echo -e "\e[1;35mDid not change the theme.\e[0m"
  fi
else
  echo -e "\e[1;31mFailed to move the directory.\e[0m"
  exit 1
fi

