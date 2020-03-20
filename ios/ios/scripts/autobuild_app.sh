#!/bin/sh

configuration="Release"
DEV_FLAG=""
VER_FLAG=""
RELEASE_FLAG="Stable"
ENV_FLAG="pro"
PROFILE_FLAG="distribution"
BIN_DIR="bin"
BUILD_DIR="build"
CUR_PATH=$(pwd)

for i in "$@"
do
PFLAG=`echo $i|cut -b1-2`
PPARAM=`echo $i|cut -b3-`
if [ $PFLAG == "-b" ]
then
DEV_FLAG=$PPARAM
elif [ $PFLAG == "-v" ]
then
VER_FLAG=$PPARAM
elif [ $PFLAG == "-s" ]
then
APP_VER_FLAG=$PPARAM
elif [ $PFLAG == "-r" ]
then
if [ $PPARAM = "dev" ]; then
    RELEASE_FLAG="Dev"
else
    RELEASE_FLAG="Stable"
fi
elif [ $PFLAG == "-t" ]
then
CUR_TIME=$PPARAM
elif [ $PFLAG == "-d" ]
then
ENV_FLAG=$PPARAM
elif [ $PFLAG == "-p" ]
then
PROFILE_FLAG=$PPARAM
elif [ $PFLAG == "-k" ]
then
MANUAL_DEMO_APPKEY=$PPARAM
elif [ $PFLAG == "-u" ]
then
MANUAL_DEMO_SERVER_URL=$PPARAM
elif [ $PFLAG == "-n" ]
then
MANUAL_NAVI_SERVER_URL=$PPARAM
elif [ $PFLAG == "-f" ]
then
MANUAL_FILE_SERVER_URL=$PPARAM
elif [ $PFLAG == "-a" ]
then
MANUAL_STATS_SERVER_URL=$PPARAM
elif [ $PFLAG == "-o" ]
then
VOIP_FLAG=$PPARAM
fi
done



BUILD_APP_PROFILE=""
BUILD_SHARE_PROFILE=""

BUILD_CODE_SIGN_IDENTITY="iPhone Distribution: Beijing XXX Network Technology CO., LTD"

echo $VER_FLAG


PROJECT_NAME="TestApp.xcodeproj"
targetName="TestApp"
TARGET_DECIVE="iphoneos"

rm -rf DerivedData
rm -rf "$BIN_DIR"
rm -rf "$BUILD_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$BUILD_DIR"
xcodebuild clean -alltargets

echo "***开始build iphoneos文件***"
  xcodebuild -scheme "${targetName}" archive -archivePath "./${BUILD_DIR}/${targetName}.xcarchive" -configuration "${configuration}" APP_PROFILE="${BUILD_APP_PROFILE}" SHARE_PROFILE="${BUILD_SHARE_PROFILE}"
  xcodebuild -exportArchive -archivePath "./${BUILD_DIR}/${targetName}.xcarchive" -exportOptionsPlist "archive.plist" -exportPath "./${BIN_DIR}"
  mv ./${BIN_DIR}/${targetName}.ipa ${CUR_PATH}/${BIN_DIR}/${targetName}_v${VER_FLAG}_${DEV_FLAG}_${CUR_TIME}.ipa
  cp -af ./${BUILD_DIR}/${targetName}.xcarchive/dSYMs/${targetName}.app.dSYM ${CUR_PATH}/${BIN_DIR}/${targetName}_v${VER_FLAG}_${DEV_FLAG}_${CUR_TIME}.app.dSYM

echo "***编译结束***"
