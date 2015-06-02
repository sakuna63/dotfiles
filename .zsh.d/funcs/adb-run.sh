#/bin/zsh

set -e

function show_usage() {
  echo 'adb-run [-f flavor_name] [-p package_name]'
  exit 1
}

while getopts :f:p:h o; do
  case $o in
    f ) FLAVOR_NAME=$OPTARG ;;
    p ) PACKAGE_NAME=$OPTARG ;;
    h ) show_usage ;;
    * ) show_usage ;;
  esac
done

if [ -z $FLAVOR_NAME ]; then
  count_manifests=`tree -f | grep '/src/.*/AndroidManifest.xml' | wc -l`

  if [ $count_manifests -le 1 ]; then
    FLAVOR_NAME=main
    break
  fi

  echo 'Multi manifest files are found. Please pass variant name using "-f flavor_name" option'
  echo 'Found manifest files are below \n'
  tree -f | grep '/src/.*/AndroidManifest.xml' | sed -e 's/.\+\.\//.\//'
  exit 1
fi

path_to_manifest=`tree -f | grep /src/$FLAVOR_NAME/AndroidManifest.xml | sed -e 's/.\+\.\//.\//'`
if [ -z $path_to_manifest ]; then
  echo "AndroidManifest.xml not found for flavor \"$FLAVOR_NAME\" "
  exit 1
fi

if [ -z $PACKAGE_NAME ]; then
  PACKAGE_NAME=`xmllint $path_to_manifest --xpath /manifest/@package | sed -e 's/.\+"\(.\+\)"/\1/'`
  if [ -z $PACKAGE_NAME ]; then
    echo "Pakcage name is not found for flavor \"$FLAVOR_NAME\" "
    exit 1
  fi
fi

activity=`xpath $path_to_manifest '//activity[intent-filter[action[@android:name="android.intent.action.MAIN"]]' 2>/dev/null | grep '<activity' | sed -e 's/.\+android:name="\(.\+\)"\s\+.\+/\1/'`
if [ -z $activity ]; then
  echo "Default actiivty name is not found for flavor \"$FLAVOR_NAME\" "
  exit 1
fi

echo "ADB_SHELL_COMMAND: adb shell am start -n \"$PACKAGE_NAME/$activity\" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER"
adb shell am start -n "$PACKAGE_NAME/$activity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
