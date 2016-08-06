# 使用 Tmux 强化终端功能
tmux是一个优秀的终端复用软件，类似GNU Screen，但来自于OpenBSD，采用BSD授权。使用它最直观的好处就是通过一个终端登录远程主机并运行tmux后，在其中可以开启多个控制台而无需再“浪费”多余的终端来连接这台远程主机；当然其功能远不止于此。

## 安装

可以使用Ports安装tmux，位置在/usr/ports/sysutils/tmux/；tmux仅有一个依赖包libevent，位于/usr/ports/devel/libevent/。

安装完成后输入命令tmux即可打开软件，界面十分简单，类似一个下方带有状态栏的终端控制台

根据tmux的定义，在开启了tmux服务器后会首先创建一个会话，而这个会话则会首先创建一个窗口，其中仅包含一个面板

也就是说，这里看到的所谓终端控制台应该称作tmux的一个面板，虽然其使用方法与终端控制台完全相同。

tmux使用C/S模型构建，主要包括以下单元模块：

```
server        服务器。输入tmux命令时就开启了一个服务器。
session        会话。一个服务器可以包含多个会话。
window        窗口。一个会话可以包含多个窗口。
pane        面板。一个窗口可以包含多个面板。
基本操作
恢复会话
tmux attach
复制终端中字符串的步骤
Ctrl+a 按 [ 进入 tmux屏幕拷贝模式
然后按空格键开始复制
使用类似vim的上下左右键方式进行选中
按enter退出复制模式
Ctrl＋a 按 ］ 进行粘贴
```

## 系统操作

```
?             列出所有快捷键；按q返回
d             脱离当前会话；这样可以暂时返回Shell界面，输入tmux attach能够重新进入之前的会话
D             选择要脱离的会话；在同时开启了多个会话时使用
Ctrl+z         挂起当前会话
r             强制重绘未脱离的会话
s             选择并切换会话；在同时开启了多个会话时使用
:             进入命令行模式；此时可以输入支持的命令，例如kill-server可以关闭服务器
[             进入复制模式；此时的操作与vi/emacs相同，按q/Esc退出
~             列出提示信息缓存；其中包含了之前tmux返回的各种提示信息
```

## 窗口操作

```
c             创建新窗口
&             关闭当前窗口
数字键         切换至指定窗口
p             切换至上一窗口
n             切换至下一窗口
l             在前后两个窗口间互相切换
w             通过窗口列表切换窗口
,             重命名当前窗口；这样便于识别
.             修改当前窗口编号；相当于窗口重新排序
f             在所有窗口中查找指定文本
```

## 面板操作

```
"             将当前面板平分为上下两块
%             将当前面板平分为左右两块
x             关闭当前面板
!             将当前面板置于新窗口；即新建一个窗口，其中仅包含当前面板
Ctrl+方向键 以1个单元格为单位移动边缘以调整当前面板大小
Alt+方向键     以5个单元格为单位移动边缘以调整当前面板大小
Space         在预置的面板布局中循环切换；依次包括even-horizontal、even-vertical、main-horizontal、main-vertical、tiled
q             显示面板编号
o             在当前窗口中选择下一面板
方向键         移动光标以选择面板
{             向前置换当前面板
}             向后置换当前面板
Alt+o         逆时针旋转当前窗口的面板
Ctrl+o         顺时针旋转当前窗口的面板
```

## 配置

[配置文件".tmux.conf"](https://github.com/hoseahsu/configuration/blob/master/.tmux.conf)

### 系统启动进入tmux

修改 ~/.bashrc 文件，在文件最后加上下面的内容::

```bash
tmux_init()
{
    tmux new-session -s "kumu" -d -n "local"    # 开启一个会话
    tmux new-window -n "other"                  # 开启一个窗口
    tmux split-window -h                        # 开启一个竖屏
    tmux split-window -v "top"                  # 开启一个横屏,并执行top命令
    tmux -2 attach-session -d                   # tmux -2强制启用256color，连接已开启的tmux
}

# 判断是否已有开启的tmux会话，没有则开启
if which tmux 2>&1 >/dev/null; then
    test -z "$TMUX" && (tmux attach || tmux_init)
fi
```

## 如果安装了 powerline，那么在最后一行加上下面的语句：

```bash
source '/usr/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf'
```
