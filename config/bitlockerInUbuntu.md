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
cd ~/tmp/dislocker
cmake .
make
sudo make install
```
