#!/bin/bash
################################################################################
#     > File Name: update.sh
#     > Author: Hosea Hsu
#     > Mail: hoseahsu@gmail.com
#     > Created Time: 2016年08月31日 星期三 16时45分18秒
################################################################################
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get clean
sudo apt-get autoclean
