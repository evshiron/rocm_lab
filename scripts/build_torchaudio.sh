#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

export ROCM_PATH=/opt/rocm-5.5.0
export PYTORCH_ROCM_ARCH=gfx1100

# build torchvision

curl -L -O https://github.com/evshiron/rocm_lab/releases/download/v1.14.514/torch-2.0.1+gite19229c-cp310-cp310-linux_x86_64.whl
pip install torch-2.0.1+gite19229c-cp310-cp310-linux_x86_64.whl

git clone -b v2.0.2 https://github.com/pytorch/audio audio-2.0.2

cd audio-2.0.2
git reset --hard
# not needed for this version
#echo 2.0.2 > version.txt

# this file is required but is missing in rocm distribution
echo 5.5.0-63 | sudo tee -a $ROCM_PATH/.info/version-dev

pip install setuptools wheel cmake ninja 

git apply ../patches/torchaudio.diff

python setup.py bdist_wheel

cd ..
