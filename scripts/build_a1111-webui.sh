#!/bin/sh

set -ex

# taken from https://github.com/camenduru/stable-diffusion-webui-colab

apt install -y -qq git wget aria2 libcairo2-dev pkg-config python3-dev libgoogle-perftools-dev

git clone -b v2.1 https://github.com/camenduru/stable-diffusion-webui

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/embed/upscale/resolve/main/4x-UltraSharp.pth -d /root/stable-diffusion-webui/models/ESRGAN -o 4x-UltraSharp.pth
git clone https://github.com/camenduru/stable-diffusion-webui-images-browser /root/stable-diffusion-webui/extensions/stable-diffusion-webui-images-browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks /root/stable-diffusion-webui/extensions/sd-webui-additional-networks
git clone https://github.com/Mikubill/sd-webui-controlnet /root/stable-diffusion-webui/extensions/sd-webui-controlnet
git clone https://github.com/KohakuBlueleaf/a1111-sd-webui-locon /root/stable-diffusion-webui/extensions/a1111-sd-webui-locon
git clone https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111 /root/stable-diffusion-webui/extensions/multidiffusion-upscaler-for-automatic1111
git clone https://github.com/thomasasfk/sd-webui-aspect-ratio-helper /root/stable-diffusion-webui/extensions/sd-webui-aspect-ratio-helper

cd /root/stable-diffusion-webui

pip install git+https://github.com/TencentARC/GFPGAN.git@8d2447a2d918f8eba5a4a01463fd48e45126a379
pip install git+https://github.com/openai/CLIP.git@d50d76daa670286dd6cacf3bcd80b5e4823fc8e1
pip install git+https://github.com/mlfoundations/open_clip.git@bb6e834e9c70d9c27d0dc3ecedeebeaeb1ffad6b

mkdir -p /root/stable-diffusion-webui/repositories

git clone https://github.com/Stability-AI/stablediffusion /root/stable-diffusion-webui/repositories/stable-diffusion-stability-ai
git clone https://github.com/CompVis/taming-transformers /root/stable-diffusion-webui/repositories/taming-transformers
git clone https://github.com/crowsonkb/k-diffusion /root/stable-diffusion-webui/repositories/k-diffusion
git clone https://github.com/sczhou/CodeFormer /root/stable-diffusion-webui/repositories/CodeFormer
git clone https://github.com/salesforce/BLIP /root/stable-diffusion-webui/repositories/BLIP

pip install -r /root/stable-diffusion-webui/repositories/CodeFormer/requirements.txt
pip install -r /root/stable-diffusion-webui/requirements.txt

# python launch.py --listen
