

```bash
export OCP_VERSION="4.16.37"
VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos' | awk -F ' ' '{print $2}')
echo $VARIABLE_NAME
podman build -t quay.io/midu/kernel-6.15.0-0.rc7.58.fc43.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .

```