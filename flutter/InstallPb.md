# Flutter pb install

安装protoc

```
brew install protobuf
```



安装dart

```
brew tap dart-lang/dart
brew install dart
```

dart 安装好后，就有pub命令了。

安装protoc_plugin

```
pub global activate protoc_plugin
```

将protoc-gen-dart添加到path
在用户根目录：.bash_profile添加

```
export "$PATH:$PWD/.pub-cache/bin"
```

安装好后，就有protoc-gen-dart 命令了。
将.proto文件编译成dart文件

```
protoc --dart_out=. test.proto
```

如果没有添加path

```
protoc --dart_out=. test.proto --plugin ~/.pub-cache/bin/protoc-gen-dart
```

在Flutter项目中引入protobuf库
在pubspec.ymal中添加以下依赖

```
protobuf: ^0.13.4
```


报错
```
➜  ~ brew install dart
==> Installing dart from dart-lang/dart
Error: Xcode alone is not sufficient on Mojave.
Install the Command Line Tools:
  xcode-select --install
```

执行

`
xcode-select --install
`

安装完相应软件，然后执行

`
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
`