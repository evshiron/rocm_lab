
# ROCm LAB

Experiments to see the potential of RX 7000 series.

## Prebuilt wheels

* [build-rocm5.5-torch2.0-wheels.yaml](https://github.com/evshiron/rocm_lab/actions/workflows/build-rocm5.5-torch2.0-wheels.yaml)
* [build-rocm5.5-torchvision0.15-wheels.yaml](https://github.com/evshiron/rocm_lab/actions/workflows/build-rocm5.5-torchvision0.15-wheels.yaml)

## Prebuilt Docker images

* https://github.com/evshiron/rocm_lab/pkgs/container/rocm_lab
  * rocm5.5-ub22.04-base
  * rocm5.5-ub22.04-torch2.0.1
  * rocm5.5-ub22.04-a1111-webui
  * rocm5.5-ub22.04-automatic

### How to use

```bash
# add environment variables or volumes for your need
docker run -ti --net=host --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --device=/dev/kfd --device=/dev/dri --group-add video --ipc=host --shm-size 8G --name rocm5.5-automatic ghcr.io/evshiron/rocm_lab:rocm5.5-automatic
```

Non-base Docker images are configured with fixed launch arguments, making them less flexible.

You might want to make new images from them, or to tweak them via `docker exec` and `docker cp`.

## Are we gfx1100 yet?

* https://evshiron.github.io/are-we-gfx1100-yet/
