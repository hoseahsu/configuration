# oracle-jdk

要下载和安装 Java JDK8，请访问下载页获得最新的发行版本。根据你机器的 Ubuntu 系统的情况可以选择下载 32 位或 64 位的发行版本。

　　这里是下载页面

　　在下载之前，您必须接受许可协议。

　　下载文件，保存。在 Ubuntu 系统中 Firefox 浏览器会默认保存到 ~/Downloads 目录下。

　　oracle-jdk8-ubuntu

　　第二步，打开终端运行如下命令来解压下载的文件。

　　tar -xvf ~/Downloads/jdk-8-linux-x64.tar.gz
　　然后运行如下的命令，在 /usr/lib 目录中创建一个为保存 Java JDK 8 文件的目录。

　　sudo mkdir -p /usr/local/jvm/jdk1.8.0/
　　接下来运行如下命令把解压的 JDK 文件内容都移动到创建的目录中。

　　sudo mv jdk1.8.0/* /usr/local/jvm/jdk1.8.0/
　　下一步，运行如下命令来配置 Java

　　sudo update-alternatives --install "/usr/local/bin/java" "java" "/usr/local/jvm/jdk1.8/bin/java" 1
　　接下来，拷贝和粘贴下面这一行到终端执行，以启用 Javac 模块。

　　sudo update-alternatives --install "/usr/local/bin/javac" "javac" "/usr/local/jvm/jdk1.8/bin/javac" 1
　　最后，拷贝和粘贴下面一行到终端以完成最终的安装。

　　sudo update-alternatives --install "/usr/local/bin/javaws" "javaws" "/usr/local/jvm/jdk1.8/bin/javaws" 1
　　要验证下 Java 是否已经完全安装的话，可以运行下面的命令来测试。

　　java –version
## 参考文献

[百度知道链接](http://zhidao.baidu.com/link?url=UZ9M0i2BVm08yqxXvmPB-_l6cvErLyG8gHO4QM7qOjyhMM79RRi-AQPT9WA9PrfYaNHhQlLZVoLV4X_ufOscaroE1rCFb1pu0kgywI40qgq)
