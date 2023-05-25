#!/bin/sh

set -ex

apt install -y -qq git python3-dev

git clone https://github.com/oobabooga/text-generation-webui

pushd /root/text-generation-webui

mkdir -p repositories

pushd repositories

git clone https://github.com/WapaMario63/GPTQ-for-LLaMa-ROCm GPTQ-for-LLaMa

pushd GPTQ-for-LLaMa && python3 setup_rocm.py install && popd

popd

pip install -r requirements.txt

curl -L -O https://github.com/evshiron/rocm_lab/releases/download/v1.14.514/bitsandbytes-0.37.2-py3-none-any.whl

pip uninstall -y bitsandbytes
pip install bitsandbytes-0.37.2-py3-none-any.whl
