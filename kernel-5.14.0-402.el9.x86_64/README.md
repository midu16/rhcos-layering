# RHCOS layering

## How to build the container-base images:

```bash
$ export OCP_VERSION="4.14.5"
$ VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos' | awk -F ' ' '{print $2}')
$ podman build -t kernel-5.14.0-402.el9.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
$ podman tag localhost/kernel-5.14.0-402.el9.x86_64:${OCP_VERSION} quay.io/jclaret/kernel-5.14.0-402.el9.x86_64:${OCP_VERSION} 
$ podman push quay.io/jclaret/kernel-5.14.0-402.el9.x86_64:${OCP_VERSION}
```

## How to apply the kernel to OCP using MachineConfig:

- for `master` nodes:

```bash
$ oc create -f 99-kernel-5.14.0-402.el9-master.yaml
```

- for `worker` nodes:

```bash
$ oc create -f 99-kernel-5.14.0-402.el9-worker.yaml
```
