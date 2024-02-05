#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

export USE_CUDA=0
export ROCM_PATH=/opt/rocm-6.0.0
export PYTORCH_ROCM_ARCH=gfx1100

# build torch
if [ -d "pytorch" ]; then
    echo "pytorch folder exists. Skipping git clone."
else
    git clone --recursive https://github.com/pytorch/pytorch.git 
fi
cd pytorch

pip install cmake ninja
pip install -r requirements.txt
pip install mkl mkl-include

python3 tools/amd_build/build_amd.py

# git apply ../patches/torch.diff

python setup.py bdist_wheel

cd ..

pip install -U pytorch/dist/*.whl
