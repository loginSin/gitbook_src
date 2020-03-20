# 制作 .a 静态库

1.创建静态库项目，并把代码拷入项目中

2.项目target设为7.0：用以支持iOS7.0以上的项目

3.模式设置为Release模式：发布的静态库是真机与模拟器的Release版的合并

4.Build Settings -> Architectures -> Other -> 添加，输入armv7s：支持armv7s，默认编译的静态库是不支持的

5.选择真机，编译：产生真机的静态库，此时并不完全支持bitcode，放到其他项目中编译运行不会有问题，但是打包会报错

6.选择模拟器，编译：产生模拟器版，不支持bitcode

7.Build Settings -> Other C -> 添加 -fembed-bitcode：保证真机所有的架构都支持bitcode

8.选择真机，编译：产生完全支持bitcode的真机版静态库

9.将真机与模拟器合并,在终端中进入静态库所在Products文件夹，输入命令

lipo -create Release-iphoneos/lib.a Release-iphonesimulater/lib.a -output lib.a

：当前目录就会存在合并后的lib.a

10.其他命令

查看静态库包含的架构：

lipo -info lib.a 

file lib.a

查看静态库是否包含bitcode：

otool -l lib.a | grep bitcode 

strings lib.a

11.如果源码包含C/C++文件，那么该静态库需要依赖于系统库libc++

12.如果源码包含类扩展，需要在Build Settings -> Other Linker Flags -> 添加-ObjC

13.模拟器去掉bitcode的原因：当app打包提交的时候，必须是在真机的条件下，所以模拟器下的bitcode就不必要了，而且支持bitcode的最直观影响的就是支持bitcode的静态库会比不支持的大很多(大一倍左右)，模拟器不支持bitcode能减少静态库的大小，这样做出来的静态库支持i386,x86_64,armv7,armv7s,arm64五种架构，支持真机、模拟器，运行、打包都不会有问题

14.如果代码是纯OC的话编译出来的静态库就比较小，但是如果包含C/C++代码，将会变得巨大，如libSMB有五个OC类，大小1.6M，libSMBBase64Code有三个C++类，一个OC类，一个头文件共4.8M，libSMBUtil有三个C++类，一个OC类，一个头文件，一个.mm共6.5

参考链接

http://www.jianshu.com/p/8f5b9855efb8


http://www.cocoachina.com/bbs/read.php?tid=744514

http://www.jianshu.com/p/f42a33f5eb61