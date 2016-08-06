## 系统启动进入tmux

修改 ~/.bashrc 文件，在文件最后加上下面的内容::

```
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

source '/usr/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf'
