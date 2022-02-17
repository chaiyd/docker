ARG CUDA_VER=11.4.2-cudnn8-devel
ARG UBUNTU_VER=18.04

FROM ubuntu:${UBUNTU_VER} AS builder

ARG OPENCV_VER=4.5.5

# aliyun mirrors
#RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
#    sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list

RUN apt update && \
    apt install -y wget cmake build-essential pkg-config libgtk2.0-dev libavcodec-dev libavformat-dev libjpeg-dev libswscale-dev libtiff5-dev

RUN wget -c -O opencv-${OPENCV_VER}.tgz "https://github.com/opencv/opencv/archive/refs/tags/${OPENCV_VER}.tar.gz" && \
    tar -zxvf opencv-${OPENCV_VER}.tgz && \
    cd opencv-${OPENCV_VER} && \
    mkdir build && \
    cd build && \
    CPUNUM=$(cat /proc/cpuinfo |grep processor |wc -l) && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local/opencv -D WITH_GTK=ON -D OPENCV_GENERATE_PKGCONFIG=YES .. && \
    make -j${CPUNUM} && \
    make install

FROM nvidia/cuda:${CUDA_VER}-ubuntu${UBUNTU_VER}

RUN apt update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt install -y dumb-init python3-pip supervisor tzdata pkg-config libgtk2.0-dev && \
    cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone


COPY --from=builder /usr/local/opencv /usr/local/opencv

RUN pip3 install --no-cache-dir jupyterlab tensorboard

RUN echo "/usr/local/opencv/lib" >> /etc/ld.so.conf.d/opencv.conf
ENV OPENCV_HOME=/usr/local/opencv
ENV PKG_CONFIG_PATH=/usr/local/opencv/lib/pkgconfig
ENV PATH=$OPENCV_HOME/bin:$PKG_CONFIG_PATH:$PATH

ADD supervisor /etc/supervisor/conf.d/
ADD entrypoint.sh  /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "/usr/local/bin/entrypoint.sh"]
