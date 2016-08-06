# Linux配置

## 开机开启小键盘

首先，需要安装一个小软件，在终端中执行以下：

sudo apt-get install numlockx

然后编辑：

```
sudo gedit /etc/gdm/Init/Default
```

把下面的内容添加到最后那行的前面，（“exit 0“的前面）

```
if [ -x /usr/bin/numlockx ]; then
numlockx on
fi
```
