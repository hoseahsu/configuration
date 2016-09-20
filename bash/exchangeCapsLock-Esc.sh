#!/bin/bash
################################################################################
#     > File Name: test.sh
#     > Author: Hosea Hsu
#     > Mail: hoseahsu@gmail.com
#     > Created Time: 2016年09月20日 星期二 20时43分21秒
################################################################################
# 交换 CapsLock 和 Esc

xmodmap - <<EOF
remove Lock = Caps_Lock
keysym Escape = Caps_Lock
keysym Caps_Lock = Escape
add Lock = Caps_Lock
EOF
echo 已经交换 Caps_Lock 和 Escape 键。
