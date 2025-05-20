

```bash
export OCP_VERSION="4.16.37"
VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos' | awk -F ' ' '{print $2}')
echo $VARIABLE_NAME
podman build -t quay.io/midu/kernel-5.14.0-427.58.1.el9_4.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
podman build -t quay.io/midu/kernel-5.14.0-427.59.1.el9_4.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
podman build -t quay.io/midu/kernel-5.14.0-427.60.1.el9_4.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
podman build -t quay.io/midu/kernel-5.14.0-427.61.1.el9_4.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
podman build -t quay.io/midu/kernel-5.14.0-427.62.1.el9_4.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
podman build -t quay.io/midu/kernel-5.14.0-427.63.1.el9_4.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
podman build -t quay.io/midu/kernel-5.14.0-427.64.1.el9_4.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
```