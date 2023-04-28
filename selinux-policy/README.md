```bash
$ export OCP_VERSION="4.12.2"
$ VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos-8' | awk -F ' ' '{print $2}')
$ podman build -t selinux-policy:latest --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
$ podman tag localhost/selinux-policy:latest quay.io/midu/selinux-policy:4.12.2
$ podman push quay.io/midu/selinux-policy:4.12.2
```