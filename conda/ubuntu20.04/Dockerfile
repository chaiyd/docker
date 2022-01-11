ARG CUDA_VER=11.4.2-cudnn8-devel
FROM nvidia/cuda:${CUDA_VER}-ubuntu20.04 

ARG CONDA_VER=2021.11
ARG PYTHON_VER=3.8

RUN apt update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt install -y dumb-init supervisor tzdata wget && \
    cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

#RUN wget -c http://mirrors.aliyun.com/anaconda/archive/Anaconda3-${CONDA_VER}-Linux-x86_64.sh && \
RUN wget -c https://repo.anaconda.com/archive/Anaconda3-${CONDA_VER}-Linux-x86_64.sh && \
    bash Anaconda3-${CONDA_VER}-Linux-x86_64.sh -b -p /opt/conda && \
    rm -rf Anaconda3-${CONDA_VER}-Linux-x86_64.sh && \
    echo "export PATH=/opt/conda/bin:$PATH" >> /root/.profile && \
    /opt/conda/bin/conda update -n base -c defaults conda -y && /opt/conda/bin/conda update --all -y && \
    /opt/conda/bin/conda install python=${PYTHON_VER} pip cudatoolkit -y && \
    /opt/conda/bin/conda clean -ya && \
    /opt/conda/bin/python -m pip install --no-cache-dir jupyterlab tensorboard opencv-contrib-python

ENV PATH /opt/conda/bin:$PATH

ADD supervisor /etc/supervisor/conf.d/

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "/usr/local/bin/entrypoint.sh"]
