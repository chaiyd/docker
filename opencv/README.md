# [conda](https://github.com/chaiyd/docker/tree/master/conda)

## cuda
- https://hub.docker.com/r/nvidia/cuda
- 基于cuda-devel

## 组件
- time zone
  - Asia/Shanghai
- jupyterlab tensorboard
- supervisor
- opencv 

## 测试opencv
```
pkg-config --modversion opencv4
pkg-config --cflags opencv4
pkg-config --libs opencv4
```

- 新建demo.cpp 文件,代码如下
```
#include <iostream>
#include <opencv2/opencv.hpp>

```
- 同级目录放一张图片，名为opencv.jpg，编译
```
g++ `pkg-config opencv4 --cflags` demo.cpp  -o demo `pkg-config opencv4 --libs`
```

