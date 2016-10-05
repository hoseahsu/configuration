# C++ 函数

0|a|b|
---|---|---
1|[mkdir函数-linux](#mkdir-linux)|[access函数](#access)


---
<a name="access"></a>

### access函数

#### 函数原型
```cpp
int   access(const   char   *filename,   int   amode); 
```

#### 参数及返回值
amode参数为0时表示检查文件的存在性，如果文件存在，返回0，不存在，返回-1。 

amode|权限
---|---
06 | 检查读写权限 
04 | 检查读权限 
02 | 检查写权限 
01 | 检查执行权限 
00 | 检查文件的存在性

#### 头文件

```cpp
#include<unistd.h>//linux
#include<io.h>//windows
```

---

<a name="mkdir-linux"></a>

### mkdir函数-linux
```cpp
 
 mkdir函数
 头文件库：
 #include <sys/stat.h>
 #include <sys/types.h>
 函数原型：
 int mkdir(const char *pathname, mode_t mode);
 函数说明：
 mkdir()函数以mode方式创建一个以参数pathname命名的目录，mode定义新创建目录的权限。
 返回值：
 若目录创建成功，则返回0；否则返回-1，并将错误记录到全局变量errno中。
  
  mode方式： 
  S_IRWXU 00700权限，代表该文件所有者拥有读，写和执行操作的权限
  S_IRUSR(S_IREAD) 00400权限，代表该文件所有者拥有可读的权限
  S_IWUSR(S_IWRITE) 00200权限，代表该文件所有者拥有可写的权限
  S_IXUSR(S_IEXEC) 00100权限，代表该文件所有者拥有执行的权限
  S_IRWXG 00070权限，代表该文件用户组拥有读，写和执行操作的权限
  S_IRGRP 00040权限，代表该文件用户组拥有可读的权限
  S_IWGRP 00020权限，代表该文件用户组拥有可写的权限
  S_IXGRP 00010权限，代表该文件用户组拥有执行的权限
  S_IRWXO 00007权限，代表其他用户拥有读，写和执行操作的权限
  S_IROTH 00004权限，代表其他用户拥有可读的权限
  S_IWOTH 00002权限，代表其他用户拥有可写的权限
  S_IXOTH 00001权限，代表其他用户拥有执行的权限
```
