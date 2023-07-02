#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

export USE_CUDA=0
export PYTORCH_ROCM_ARCH=gfx1100

# build torch

git clone --depth=1 --recurse-submodules --shallow-submodules https://github.com/pytorch/pytorch

pushd pytorch

echo 2.1.0 > version.txt

pip install cmake ninja
pip install -r requirements.txt
pip install mkl mkl-include

python3 tools/amd_build/build_amd.py

python setup.py bdist_wheel

popd
