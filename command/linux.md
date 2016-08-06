
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
