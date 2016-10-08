<a name="home"></a>

# C++ 函数

0|a|b|c|d
---|---|---|---|---
1|[mkdir函数-linux](#mkdir-linux)|[access函数](#access)|[getFiles-Linux](#getFiles-Linux)|[getFiles-Windows](#getFiles-Windows)



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

#### 参考

[linux C之access函数](http://blog.sina.com.cn/s/blog_6a1837e90100uh5d.html)
[C中的access函数](http://blog.chinaunix.net/uid-22785134-id-360282.html)


[回到顶端](#home)

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

[回到顶端](#home)

---

<a name="getFiles-Linux"></a>
### getFiles linux -  获取某个文件夹内某些类型的文件

```cpp
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <dirent.h>
#include <unistd.h>

using namespace std;
int readFileList(char *basePath)
{
    DIR *dir;
    struct dirent *ptr;
    char base[1000];

    if ((dir=opendir(basePath)) == NULL)
    {
        perror("Open dir error...");
        exit(1);
    }

    while ((ptr=readdir(dir)) != NULL)
    {
        if(strcmp(ptr->d_name,".")==0 || strcmp(ptr->d_name,"..")==0)    ///current dir OR parrent dir
            continue;
        else if(ptr->d_type == 8)    ///file
            printf("d_name:%s/%s\n",basePath,ptr->d_name);
        else if(ptr->d_type == 10)    ///link file
            printf("d_name:%s/%s\n",basePath,ptr->d_name);
        else if(ptr->d_type == 4)    ///dir
        {
            memset(base,'\0',sizeof(base));
            strcpy(base,basePath);
            strcat(base,"/");
            strcat(base,ptr->d_name);
            readFileList(base);
        }
    }
    closedir(dir);
    return 1;
}

int main(void)
{
    DIR *dir;
    char basePath[1000];

    ///get the current absoulte path
    memset(basePath,'\0',sizeof(basePath));
    getcwd(basePath, 999);
    printf("the current dir is : %s\n",basePath);

    ///get the file list
    memset(basePath,'\0',sizeof(basePath));
    strcpy(basePath,"./");//获取这个文件夹的文件
    readFileList(basePath);
    return 0;
}

```


[回到顶端](#home)

---

<a name="getFiles-Windows"></a>
### getFiles Windows -  获取某个文件夹内某些类型的文件
```cpp
void getFiles(string path, vector <string>& files)
{
	/*
	char buf[200];
	FILE *fp = fopen((path + "name.txt").c_str(), "r");
	while (!feof(fp))
	{
	fgets(buf, 199, fp);
	if (buf[strlen(buf) - 1] == '\n')buf[strlen(buf) - 1] = '\0';
	cout << path + buf << endl;
	files.push_back(path + buf);
	}*/
	//文件句柄
	int i, j, lenth;
	long hFile = 0;
	char postfix[10][10] = { "jpg", "png" };//要输出的文件的后缀
	int numOfPostfix = 2;//后缀数量
	//文件信息
	struct _finddata_t fileinfo;
	string p;
	if ((hFile = _findfirst(p.assign(path).append("\\*").c_str(), &fileinfo)) != -1)
	{
		do
		{
			//如果是目录,迭代之
			//如果不是,加入列表
			if ((fileinfo.attrib &_A_SUBDIR))
			{
				if (strcmp(fileinfo.name, ".") != 0 && strcmp(fileinfo.name, "..") != 0);
				//getFiles(p.assign(path).append("\\").append(fileinfo.name), files); //递归文件夹
			}
			else
			{
				for (i = 0, lenth = strlen(fileinfo.name) - 1; i < lenth; i++)
				{
					if (fileinfo.name[i] == '.')
					{
						i++;
						break;
					}
				}
				for (j = 0; j < numOfPostfix; j++)
				{
					if (strcmp(postfix[j], &fileinfo.name[i]) == 0)
					{
						break;
					}
				}
				if (j != numOfPostfix)
				{
					cout << fileinfo.name << " " << lenth << endl;
					files.push_back(p.assign(path).append("\\").append(fileinfo.name));
				}
			}
		} while (_findnext(hFile, &fileinfo) == 0);
		_findclose(hFile);
	}
}
```

[回到顶端](#home)
