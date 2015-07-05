#!/bin/sh

set -e

APK=''
ACTIVITY=''
DEVICE_ID=''
FLAG_INSTALL=0

function show_help() {
  echo "Usage: adb-run -a activity_name -d device_id -f apk_file -i"
  echo "-i: flag indicating will install apk or not"
  exit
}

while getopts a:d:f:hi OPT; do
  case $OPT in
    a ) ACTIVITY=$OPTARG ;;
    d ) DEVICE_ID=$OPTARG ;;
    f ) APK=$OPTARG ;;
    i ) FLAG_INSTALL=1 ;;
    h ) show_help ;;
  esac
done

### Find target apk file
if [ -z "$APK" ]; then
  count_apk=`find . -name '*.apk' | wc -l`
  if [ $count_apk -eq 0 ]; then
    echo 'apk not found'
    exit
  elif [ $count_apk -eq 1 ]; then
    APK=`find . -name '*.apk'`
  else
    APK=`find . -name '*.apk' | peco`
  fi
fi

if [ -z "$APK" -o ! -e "$APK" ]; then
    echo 'apk not found'
  exit
fi

package=`aapt dump badging $APK | head -n 1 | sed -e "s/package:\sname='\(.\+\)'\sversionCode.\+/\1/"`

### Find target activity
if [ -z "$ACTIVITY" ]; then
  count_activity=`aapt dump badging $APK | grep launchable-activity | wc -l`
  if [ $count_activity -eq 0 ]; then
    echo 'launchable activity not found'
    exit
  elif [ $count_activity -eq 1 ]; then
    ACTIVITY=`aapt dump badging $APK | grep launchable-activity | sed -e "s/.\+name='\(.\+\)'\s\+label.\+/\1/"`
  else
    ACTIVITY=`aapt dump badging $APK | grep launchable-activity | peco | sed -e "s/.\+name='\(.\+\)'\s\+label.\+/\1/"`
  fi
fi

if [ -z "$ACTIVITY" ]; then
  echo 'activity not found'
  exit
fi

### Find target device
if [ -z "$DEVICE" ]; then
  count_device=`adb devices | sed '/^$/d' | wc -l`
  if [ $count_device -eq 1 ]; then
    echo "device not found"
    exit
  elif [ $count_device -eq 2 ]; then
    device=`adb devices | sed -e "1,1d"`
  else
    device=`adb devices | sed -e "1,1d" | peco`
  fi

  if [ -z "$device" ]; then
     exit
  fi

  DEVICE_ID=`echo $device | cut -d ' ' -f1`
fi

if [ -z "$DEVICE_ID" ]; then
  echo 'device not found'
  exit
fi

### show command status
cat << OUTPUT
--- Command Status ---
apk      : $APK
package  : $package
activity : $ACTIVITY
device   : $DEVICE_ID

OUTPUT

if [ $FLAG_INSTALL -eq 1 ]; then
  echo "ADB_SHELL_COMMAND: adb -s $DEVICE_ID install -r -d $APK"
  adb -s $DEVICE_ID install -r -d $APK
fi

echo "ADB_SHELL_COMMAND: adb -s $DEVICE_ID shell am start -n \"$package/$ACTIVITY\" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER"
adb -s $DEVICE_ID shell am start -n "$package/$ACTIVITY" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER

