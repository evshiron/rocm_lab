#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

export USE_CUDA=0
export PYTORCH_ROCM_ARCH=gfx1100

# build torch

curl -L -O https://github.com/pytorch/pytorch/releases/download/v2.1.2/pytorch-v2.1.2.tar.gz
tar -xzvf pytorch-v2.1.2.tar.gz

cd pytorch-v2.1.2
echo 2.1.2 > version.txt

pip install cmake ninja
pip install -r requirements.txt
pip install mkl mkl-include

python3 tools/amd_build/build_amd.py

git apply ../patches/torch.diff

python setup.py bdist_wheel

cd ..
