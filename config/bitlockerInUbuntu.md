# 在ubuntu中使用bitlocker

# 安装依赖

```bash
sudo apt-get install libfuse-dev
sudo apt-get install libmbedtls-dev
```

# 下载&编译dislocker

1. Download and then extract [Dislocker](http://www.hsc.fr/ressources/outils/dislocker/download/).
2. uzip
3. 编译

```bash
cd dislocker
cmake .
make
sudo make install
```

# 挂载 BitLocker 加密的磁盘分区

1. 查看分区信息

```bash
sudo fdisk -l
```

根据大小判断分区地址 `/dev/sdxa`

2. 创建一个空文件夹来放置 dislocker 解密挂载点，以免使用现有文件夹时 disklocker 会提示目标文件夹不为空的警告。

mkdir /dislocker

先用 disklocker 解密该分区，并选用 /dislocker 为解密挂载点，

sudo dislocker -u -V /dev/sdb1 -- /disklocker

按提示直接输入解密用的用户密码（user password）即可，不是 root 密码。其中 -u 表示使用用户设置的用户密码来解密。也可以用 -p 表示使用恢复密码（recovery password）解密。而 -V 指定要解密的分区的路径。-- /dislocker 表示将解密对象传递给 FUSE 并使用 /dislocker 文件夹作为解密文件挂载点。解密后对象访问的路径为 /dislocker/dislocker-file。

3. 然后使用系统的 mount 指令挂载解密后的文件，假设预先创建的挂载点为 /myencryptdisk。
```bash
sudo mkdir /myencryptdisk
sudo mount -o loop,rw /dislocker/dislocker-file /myencryptdisk
```

这样就将该磁盘分区挂载为可读写的文件夹 /myencryptdisk 了。
可能是因为 openSUSE 的文件浏览器 Dolphin 的关系，也可能是因为这东西本来就是这么运作的，该分区挂载后在 Dolphin 左边栏显示为 Loop Device，而不是挂载点的名称 myencryptdisk，也不是该分区的卷标。不过 Dolphin 地址栏的路径是正确地显示为 /myencryptdisk 的。


# 参考链接

[
openSUSE Tumbleweed 上读写 Windows BitLocker 加密磁盘的例子](http://www.111cn.net/sys/Windows/109813.htm)

[Use (Windows) BitLocker-encrypted drive on Ubuntu 14.04 LTS](http://askubuntu.com/questions/617950/use-windows-bitlocker-encrypted-drive-on-ubuntu-14-04-lts)
