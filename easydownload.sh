#!/bin/bash
mkdir -p ~/Downloads/Swecha_videos
echo "Enter URL:" | lolcat
read URL
echo "Enter the filename: " | lolcat
read filename
echo "Do you want to delete the residue files ? (y/n)" | lolcat
read yesorno
presentdir=$(pwd)
#echo $presentdir
$presentdir/download_bbb_data.py $URL
file="./dirname.txt"
dirname=$(cat "$file")
cd ./$dirname/Videos/
$presentdir/integrate_soundtrack.sh
$presentdir/webm_to_mp4.sh ./output.webm
cp ./output.mp4 ./$filename.mp4
mv ./$filename.mp4 ~/Downloads/Swecha_videos/
echo "File moved to Downloads/Swecha_videos folder" | lolcat
if [[ "$yesorno" = "y" ]]; then
  echo $presentdir/$dirname
  rm -rf $presentdir/$dirname
  echo "Residual files removed" | lolcat
fi
if [[ "$yesorno" = "Y" ]]; then
  echo $presentdir/$dirname
  rm -rf $presentdir/$dirname
  echo "Residual files removed" | lolcat
fi
#rm -rf ./$dirname/Videos/*.webm

#/home/manas/scratch/20210710-1853/bbb-downloader/webm_to_mp4.sh ./$dirname/Videos/deskshare.webm
#/home/manas/scratch/20210710-1853/bbb-downloader/webm_to_mp4.sh ./$dirname/Videos/webcams.webm
