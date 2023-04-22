# RHCOS layering

## How to build the container-base images:

```bash
$ export OCP_VERSION="4.12.0"
$ VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos-8' | awk -F ' ' '{print $2}')
$ podman build -t side-kernel-4.18.0-372.40.1.el8_6.iavf.bz2149746.bz2152493.x86_64:latest --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
$ podman tag localhost/side-kernel-4.18.0-372.40.1.el8_6.iavf.bz2149746.bz2152493.x86_64:latest quay.io/midu/side-kernel-4.18.0-372.40.1.el8_6.iavf.bz2149746.bz2152493.x86_64:4.12.0
$ podman push quay.io/midu/side-kernel-4.18.0-372.40.1.el8_6.iavf.bz2149746.bz2152493.x86_64:4.12.0
```