#!/bin/sh

path=${HOME}/.config/polybar/arch.sh

while true; do
   checkupdates | nl -w2 -s '. ' >| ${path}repo.pkgs
   yay -Su --aur --quiet | sed 's/://;s/==/-/' >| ${path}aur.pkgs
   updates=$(cat ${path}*.pkgs | wc -l)

   echo "0" >| ${path}status
   [ $updates -gt 0 ] && echo "%{F3e60053}$updates" >| ${path}status

   >| ${path}packages
   [ -s ${path}repo.pkgs ] && cat ${path}repo.pkgs >> ${path}packages
   [ -s ${path}repo.pks ] && [ -s ${path}aur.pkgs ] && printf "\n" >> ${path}packages
   [ -s ${path}aur.pkgs ] && sed '1iAUR Updates' ${path}aur.pkgs >> ${path}packages

   sleep 600
done
