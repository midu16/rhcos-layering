# How to patch the crio using day2-machine config

## How to build the container-base images:

```bash
podman build -t runc-patch:latest . --no-cache
```

## Publically available image:

```bash
$ podman pull quay.io/midu/runc-patch:latest
```

## How to use the image in OCP using machine-config:
