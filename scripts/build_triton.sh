#!/bin/sh

set -ex

python3 -m venv venv

source venv/bin/activate

export TRITON_USE_ROCM=ON

# build triton

git clone https://github.com/are-we-gfx1100-yet/triton

pushd triton

pip install setuptools wheel cmake

pushd python

python setup.py bdist_wheel

popd

popd
