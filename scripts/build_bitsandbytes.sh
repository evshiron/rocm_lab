#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

curl -O https://pub-1cbfe09f357e4aa1a82dc7a43cc443ab.r2.dev/wheel/torch-2.0.1%2Bgitd0d0524-cp310-cp310-linux_x86_64.whl
pip install torch-2.0.1%2Bgitd0d0524-cp310-cp310-linux_x86_64.whl

curl -O https://pub-1cbfe09f357e4aa1a82dc7a43cc443ab.r2.dev/wheel/torchvision-0.15.2%2B6770a25-cp310-cp310-linux_x86_64.whl
pip install torchvision-0.15.2%2B6770a25-cp310-cp310-linux_x86_64.whl
  
export CUDA_VERSION=gfx1100

# build bitsandbytes-rocm

git clone https://github.com/evshiron/bitsandbytes-rocm

cd bitsandbytes-rocm

pip install setuptools wheel cmake ninja

make hip
python setup.py bdist_wheel

cd ..
