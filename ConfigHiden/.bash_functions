#!/bin/bash
# sourced by .bashrc

# uncompress depending on extension...
extract() {    
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2) tar xvjf "$1"   ;;
      *.tar.gz)  tar xvzf "$1"   ;;
      *.bz2)     bunzip2 "$1"    ;;
      *.rar)     unrar x "$1"    ;;
      *.gz)      gunzip "$1"     ;;
      *.tar)     tar xvf "$1"    ;;
      *.tbz2)    tar xvjf "$1"   ;;
      *.tgz)     tar xvzf "$1"   ;;
      *.zip)     unzip "$1"      ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1"       ;;
      *)
      echo "'$1' cannot be extracted"
      return 1
      ;;
    esac
  else
    echo "'$1' is not a valid file"
    return 1
  fi
  return 0
}

# add by artist to mpc
addartist() {
  mpc clear
  mpc search artist "$@" | mpc add
  [ $? -eq 0 ] && mpc play
}

# make a thumb %20 the size of a pic
thumbit() {
  if [ -z $1 ]; then
    echo "please supply a file to shrink"
    return 1 
  fi

  case $1 in
    *.jpg)
      thumb=$(echo "$1" | sed s/.jpg/-thumb.jpg/g)
      cp $1 $thumb
      mogrify -resize 20% $thumb
    ;;
    *.jpeg)
      thumb=$(echo "$1" | sed s/.jpeg/-thumb.jpeg/g)
      cp $1 $thumb
      mogrify -resize 20% $thumb
    ;;
    *.png)
      thumb=$(echo "$1" | sed s/.png/-thumb.png/g)
      cp $1 $thumb
      mogrify -resize 20% $thumb
    ;;
    *)
      echo "Image must be .jpg, .jpeg, or .png"
      return 1
    ;;
  esac
}

# grep by paragraph
grepp() {
  [ $# -ne 2 ] && return 1
  perl -00ne "print if /$1/i" < $2
}

# pull a single file out of a .tar.gz
pullout() {
  if [ $# -ne 2 ]; then
    echo "need proper arguments:"
    echo "pullout [file] [archive.tar.gz]"
    return 1
  fi
  case $2 in
    *.tar.gz|*.tgz)
    gunzip < $2 | tar -xf - $1
    ;;
    *)
    echo $2 is not a valid archive
    return 1
    ;;
  esac
  return 0
}

# recursively fix dir/file permissions on a given directory
fix() {
  if [ -d "$1" ]; then 
    find "$1" -type d -exec chmod 755 {} -type f -exec chmod 644 {} \;
  else
    echo "$1 is not a directory."
  fi
}

# manage services
service() {
  if [ $# -lt 2 ]; then
    echo "Missing service name or command"
    return 1
  fi
  sudo /etc/rc.d/$1 $2 && return 0
}

# open a GUI app from CLI
open() {
  $1 >/dev/null 2>&1 &
}

# choose a random wallpaper
randomwp() {
  local PIC=$(ls $HOME/Pictures/backgrounds | sort -R | head -1)
  feh --bg-scale $HOME/Pictures/backgrounds/$PIC
}

# take a timestamped screenshot
shot(){
  local PIC="$HOME/Pictures/screenshots/desktop_$(date +%y%m%d%H%M).png"
  scrot -t 20 -cd 3 $PIC
}

# auto send an attachment from CLI
send() {
  echo "File auto-sent from linux." | mutt -s "See Attached File" -a $1 $2
}

# rip a file with handbrake and good options
rip() {
  handbrake -i /dev/dvd -o $HOME/Movies/$1.mp4 -L -U -F -f mp4 -e x264 -b 4000 -B 192
}

# simple calculator
calc() {
  echo "scale=3; $@" | bc
}

# make a backup before editing a file
safeedit() {
  cp $1 $1.backup && vim $1
}

# save a file to ~/Temp
saveit() {
  cp $1 $HOME/Temp/$1.saved
}

# switch two files (comes in handy)
switchfile() {
  mv $1 $1.tmp && mv $2 $1 && mv $1.tmp $2
}
function srch() {
    grep -R $1 * | grep -v "\.svn" 
}
function mp4tomp3() {
	for n in `ls -l | awk '{print $9}'` ; do 
    	ffmpeg -i $n -vn -ar 44100 -ac 2 -ab 192000 -f mp3 $n.mp3 ;
	done 	
}
function up() {
	if [ -z "$1" ] ; then 
	echo "Debe especificar la ruta" 
	ompload $1 
	#icecat `grep http /tmp/upload | cut -d " " -f 4 | sed s/v/i/g`
	fi 	
}
geoip() { links -dump "http://www.geoiptool.com/en/?IP=$1" | sed -n '/Host Name/,/Postal code/p' ; }













