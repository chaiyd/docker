ARG CUDA_VER=11.2.2-cudnn8-devel
ARG BASEIMAGES=ubuntu18.04
FROM nvidia/cuda:${CUDA_VER}-${BASEIMAGES}

#ARG CONDA_VER=2021.11
#ARG PYTHON_VER=3.8

ARG MINICONDA_VER=py39_4.11.0
ARG PLATFORM=Linux-x86_64
ARG MINICONDA="Miniconda3-${MINICONDA_VER}-${PLATFORM}.sh" 

RUN apt update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt install -y dumb-init supervisor tzdata wget && \
    cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

#RUN wget -c http://mirrors.aliyun.com/anaconda/archive/Anaconda3-${CONDA_VER}-Linux-x86_64.sh && \
#https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#https://repo.anaconda.com/miniconda/Miniconda3-py38_4.11.0-Linux-x86_64.sh

RUN wget -c -O ${MINICONDA} "https://repo.anaconda.com/miniconda/${MINICONDA}" && \ 
#RUN wget -c https://repo.anaconda.com/archive/Anaconda3-${CONDA_VER}-Linux-x86_64.sh && \
    bash ${MINICONDA} -b -p /opt/conda && \
    rm -rf ${MINICONDA} && \
    #echo "export PATH=${PATH}:/opt/conda/bin" >> /root/.profile && \
    /opt/conda/bin/conda update -n base -c defaults conda -y && /opt/conda/bin/conda update --all -y && \
    /opt/conda/bin/conda install python=${PYTHON_VER} pip cudatoolkit -y && \
    /opt/conda/bin/conda clean -ya && \
    /opt/conda/bin/python -m pip install --no-cache-dir jupyterlab tensorboard opencv-contrib-python && \
    mkdir -p /root/.jupyter && \
    echo "c.FileContentsManager.delete_to_trash = False" >> /root/.jupyter/jupyter_notebook_config.py

ENV PATH $PATH:/opt/conda/bin

ADD supervisor /etc/supervisor/conf.d/
ADD entrypoint.sh  /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh 

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["bash", "-c", "/usr/local/bin/entrypoint.sh"]
