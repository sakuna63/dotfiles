#!/bin/sh

set -e

function show_usage()
{
  echo "Usage: adb-run -a activity_name -d device_id -f path_to_apk_file -i"
  echo "-i: flag indicating whather attempting to install apk or not"
  exit 1
}

while getopts a:d:f:hic OPT
do
  case $OPT in
    a ) _ACTIVITY=$OPTARG ;;
    d ) _DEVICE_ID=$OPTARG ;;
    f ) _APK=$OPTARG ;;
    i ) _FLAG_INSTALL=1 ;;
    c ) _FLAG_COPY_OPTIONS=1 ;;
    h ) show_usage ;;
  esac
done

function find_apk()
{
  local apks="$(find . -name '*.apk')"
  local count=`echo $apks | wc -w`
  if [ $count -le 1 ]; then
    echo $apks
  else
    echo $apks | tr -s ' ' '\n' | peco
  fi
}

function find_activity()
{
  local activities="`aapt dump badging $1 | grep launchable-activity | sed -e "s/.\+name='\(.\+\)'\s\+label.\+/\1/"`"
  local count=`echo ${activities} | wc -w`
  if [ $count -le 1 ]; then
    echo $activities
  else
    echo $activities | tr -s ' ' '\n' | peco
  fi
}

function find_package()
{
  aapt dump badging $1 | head -n 1 | sed -e "s/package:\sname='\(.\+\)'\sversionCode.\+/\1/"
}

function find_device()
{
  count=`adb devices | sed '/^$/d' | wc -l`
  if [ $count -le 2 ]; then
    adb devices | sed -e "1,1d" | cut -f 1
  else
    adb devices | sed -e "1,1d" | peco | cut -f 1
  fi
}

function copy_to_clipboard()
{
  if which pbcopy >/dev/null 2>&1 ; then
      # Mac
      echo $1 | pbcopy
  elif which xsel >/dev/null 2>&1 ; then
      # Linux
      echo $1 | xsel --input --clipboard
  elif which putclip >/dev/null 2>&1 ; then
      # Cygwin
      echo $1 | putclip
  else
    echo "copying method does not found."
    echo "supported command is [pbcopy, xsel, putclip]"
  fi
}

[ -z "$_APK" ] && _APK=`find_apk`
if [ ! -e "$_APK" ]; then
  echo "apk ${_APK} does not found"
  exit 0
fi

[ -z "$_ACTIVITY" ] && _ACTIVITY=`find_activity ${_APK}`
if [ -z "$_ACTIVITY" ]; then
  echo "activity ${_ACTIVITY} does not found"
  exit 0
fi

[ -z "$_DEVICE_ID" ] && _DEVICE_ID=`find_device`
if [ -z "$_DEVICE_ID" ]; then
  echo "device ${_DEVICE_ID} does not found"
  exit 0
fi

package=`find_package ${_APK}`
### show command status
cat << OUTPUT
--- Command Status ---
apk      : $_APK
package  : $package
activity : $_ACTIVITY
device   : $_DEVICE_ID

OUTPUT

if [ -n "${_FLAG_INSTALL}" ]; then
  echo "ADB_SHELL_COMMAND: adb -s $_DEVICE_ID install -r -d $_APK"
  adb -s $_DEVICE_ID install -r -d $_APK
fi

if [ -n "${_FLAG_COPY_OPTIONS}" ]; then
  echo "option copied"
  copy_to_clipboard "-a $_ACTIVITY -d $_DEVICE_ID -f $_APK"
fi

echo "ADB_SHELL_COMMAND: adb -s $_DEVICE_ID shell am start -n \"$package/$_ACTIVITY\" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER"
adb -s $_DEVICE_ID shell am start -n "$package/$_ACTIVITY" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
