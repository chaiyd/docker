# [conda](https://github.com/chaiyd/docker/tree/master/conda)

## cuda
- https://hub.docker.com/r/nvidia/cuda
- 基于cuda-devel

## tag
- chaiyd/conda:${{ env.MINICONDA_VER }}-cuda${{ env.CUDA_VER }}-ubuntu18.04

## 组建
- time zone
  - Asia/Shanghai
- conda ----> miniconda
  - python 
  - cudatoolkit
  - jupyterlab tensorboard opencv-contrib-python
- supervisor
- 
