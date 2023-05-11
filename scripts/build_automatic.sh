#!/bin/sh

set -ex

# taken from https://github.com/camenduru/stable-diffusion-webui-colab

apt install -y -qq git wget aria2 libcairo2-dev pkg-config python3-dev libgoogle-perftools-dev

git clone -b v20230512 https://github.com/evshiron/automatic

cd /root/automatic

git reset --hard
git submodule update --init --recursive

pip install git+https://github.com/openai/CLIP.git@d50d76daa670286dd6cacf3bcd80b5e4823fc8e1

mkdir -p /root/automatic/repositories

git clone https://github.com/Stability-AI/stablediffusion /root/automatic/repositories/stable-diffusion-stability-ai
git clone https://github.com/CompVis/taming-transformers /root/automatic/repositories/taming-transformers
git clone https://github.com/crowsonkb/k-diffusion /root/automatic/repositories/k-diffusion
git clone https://github.com/sczhou/CodeFormer /root/automatic/repositories/CodeFormer
git clone https://github.com/salesforce/BLIP /root/automatic/repositories/BLIP

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/embed/upscale/resolve/main/4x-UltraSharp.pth -d /root/automatic/models/ESRGAN -o 4x-UltraSharp.pth

pip install -r /root/automatic/repositories/CodeFormer/requirements.txt
pip install -r /root/automatic/requirements.txt

pip install tensorflow==2.12.0
