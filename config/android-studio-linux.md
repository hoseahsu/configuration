# android studio for linux

## 安装jdk（oracle jd）

[oracle-jdk 安装](https://github.com/hoseahsu/configuration/blob/master/config/oracle-jdk.md)

## 安装 android studio

1. 去[android studio 中文社区](http://www.android-studio.org/index.php/download)下载android studio 的ide和sdk(可在ide的安装过程中然其自动下载sdk)

2. 将ide解压到需要安装的文件夹

3. 按照提示继续便可！

## 遇到的问题

### ide自动下载好sdk过后出现unable to run mksdcard sdk 错误

系统是ubantu 16.04 64位

原因：缺少32位lib

解决方法：

```
sudo apt-get install lib32z1 lib32ncurses5  lib32stdc++6
```

## 参考

[unable to run mksdcard sdk](http://www.linuxdiyf.com/linux/13124.html)

[64位Ubuntu15.04安装Android Studio教程](http://www.linuxdiyf.com/linux/12081.html)
