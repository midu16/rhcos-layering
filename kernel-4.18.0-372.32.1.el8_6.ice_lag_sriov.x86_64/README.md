# RHCOS layering

## How to build the container-base images:

```bash
$ export OCP_VERSION="4.12.8"
$ VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos-8' | awk -F ' ' '{print $2}')
$ podman build -t kernel-4.18.0-372.32.1.el8_6.ice_lag_sriov.x86_64:4.12.8 --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
$ podman tag localhost/kernel-4.18.0-372.32.1.el8_6.ice_lag_sriov.x86_64:4.12.8 quay.io/midu/kernel-4.18.0-372.32.1.el8_6.ice_lag_sriov.x86_64:4.12.8
$ podman push quay.io/midu/kernel-4.18.0-372.32.1.el8_6.ice_lag_sriov.x86_64:4.12.8
```

## How to apply the kernel to OCP using MachineConfig:

- for `master` nodes:

```bash
$ oc create -f 99-kernel-4.18.0-372.32.1.el8_6.ice_lag_sriov-master.yaml
```

- for `worker` nodes:

```bash
$ oc create -f 99-kernel-4.18.0-372.32.1.el8_6.ice_lag_sriov-worker.yaml
```