# 制作 .framework 静态库

1.创建静态库项目，例如叫做“View”，并把代码拷入项目中

2.项目target设为7.0：用以支持iOS7.0以上的项目

3.模式设置为Release模式：发布的静态库是真机与模拟器的Release版的合并

4.Build Settings -> Mach-O Type -> Static Library：设置为静态库模式,如果没有设置，真机版的二进制文件查不到bitcode

5.Build Settings -> Architectures -> Other -> 添加，输入armv7s：支持armv7s，默认编译的静态库是不支持的，如果静态库不需要支持armv7s，可以忽略这一步

6.Build Phases -> Headers 将需要暴漏出来的头文件添加到Public中

7.选择真机，编译：产生真机的静态库，此时并不完全支持bitcode，放到其他项目中编译运行不会有问题，但是打包会报错

8.选择模拟器，编译：产生模拟器版，不支持bitcode

9.Build Settings -> Other C -> 添加 -fembed-bitcode：保证真机所有的架构都支持bitcode

10.选择真机，编译：产生完全支持bitcode的真机版静态库

11.将真机与模拟器合并,在终端中进入静态库所在Products文件夹，输入命令

lipo -create Release-iphoneos/View.framework/View Release-iphonesimulater/View.framework/View -output View 

：静态库framework的二进制文件是库中与库名相同的那个文件，而.a静态库的二进制文件就是.a文件，所以合并真机模拟器的.a是合并两个版本的.a，合并framework是合并二者中的库名相同的文件

12.将真机或者模拟器中的View.framework拷贝出来，将上步生成的View二进制文件替换掉View.framework中的Viewbi

13.其他命令

查看静态库包含的架构：

lipo -info View.framework/View

file View.framework/View

查看静态库是否包含bitcode：

otool -l View.framework/View | grep bitcode 

14.如果源码包含C/C++文件，那么该静态库需要依赖于系统库libc++

15.如果源码包含类扩展，需要在Build Settings -> Other Linker Flags -> 添加-ObjC