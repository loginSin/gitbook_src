#!/bin/sh

configuration="Release"
DEV_FLAG=""
VER_FLAG=""
ENV_FLAG="pro"

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
elif [ ${PFLAG} == "-d" ]
then
ENV_FLAG=$PPARAM
fi
done


sed -i ""  -e '/CFBundleShortVersionString/{n;s/[0-9]\.[0-9]\.[0-9]\{1,2\}/'"$VER_FLAG"'/; }' ./TestSDK/Info.plist

if [ ${DEV_FLAG} == "debug" ]
then
configuration="Debug"
else
configuration="Release"
fi

PROJECT_NAME="TestSDK.xcodeproj"
targetName="TestSDK"
TARGET_DECIVE="iphoneos"
TARGET_I386="iphonesimulator"

xcodebuild clean -configuration $configuration -sdk $TARGET_DECIVE
xcodebuild clean -configuration $configuration -sdk $TARGET_I386

echo "***开始Build ${targetName} Framework ${configuration}****"
echo "***开始build iphonesimulator文件***"
xcodebuild -project ${PROJECT_NAME} -target "$targetName" -configuration $configuration  -sdk $TARGET_I386 build
echo "***开始build iphoneos文件***"
xcodebuild -project ${PROJECT_NAME} -target "$targetName" -configuration $configuration  -sdk $TARGET_DECIVE build
echo "***完成Build ${targetName} Framework ${configuration}****"
