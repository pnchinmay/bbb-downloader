#!/bin/bash
mkdir -p ~/Downloads/bbb_downloader_videos
URL=$(zenity --entry --text "Please enter the URL")
filename=$(zenity --entry --text "Please enter filename")
yesorno=$(zenity --entry --text "Do you want to delete the residue files ? (y/n)")
(
xmd=$(pwd)
presentdir=$xmd
$presentdir/download_bbb_data.py $URL
file="./dirname.txt"
dirname=$(/usr/bin/cat "$file")
cd ./$dirname/Videos/
$presentdir/integrate_soundtrack.sh
$presentdir/webm_to_mp4.sh ./output.webm
cp ./output.mp4 ./$filename.mp4
mv ./$filename.mp4 ~/Downloads/bbb_downloader_videos/
killall zenity
) | zenity --progress --pulsate --text "Downloading video"
file="./dirname.txt"
dirname=$(/usr/bin/cat "$file")
zenity --info --text "File downloaded to ~/Downloads/bbb_downloader_videos folder"
if [[ "$yesorno" = "y" ]]; then
  rm -rf $dirname
fi
if [[ "$yesorno" = "Y" ]]; then
  rm -rf $dirname
fi
