
### 查看硬件信息 

```
sudo dmidecode | more 
```

### 查看文件夹大小 

```
sudo du -h --max-depth=1 /usr 
```

### 断点续传下载

```
1. axel -a -v http://user:passwd@url
2. axel -a -v ftp://user:passwd@rul
3. wget -c url --http-user='username' --http-passwd='passworld'
```

### Linux中在终端打开图形界面的文件夹的方法

```
gnome-open /etc

# ubuntu中
nautilus /etc
```
### 绝对地址的文件列表

```
$ ls | sed "s:^:`pwd`/: "
```

### uuid/自动挂载分区
挂载自动分区

```
$ ls -al /dev/disk/by-uuid # 复制出需要挂载分区的uuid
$ vi /etc/fstab
```
按照 `uuid=<uuid>  <mount point>  <file system type>  <options> <dump> <pass>` 格式 添加一行需要挂载的信息

### 终端使用的shell

```
sudo vi /etc/passwd
```
