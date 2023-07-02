#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

export FORCE_CUDA=1

# build torchvision

curl -L -O https://github.com/evshiron/rocm_lab/releases/download/rocm-5.6-builds/torch-2.1.0+gitf353d17-cp310-cp310-linux_x86_64.whl
pip install torch-2.1.0+gitf353d17-cp310-cp310-linux_x86_64.whl

git clone --depth=1 https://github.com/pytorch/vision

pushd vision

echo 0.16.0 > version.txt

pip install setuptools wheel cmake ninja 

python setup.py bdist_wheel

popd
