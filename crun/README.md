```bash
export OCP_VERSION="4.14.43"
VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos' | awk -F ' ' '{print $2}')
echo $VARIABLE_NAME
podman build -t quay.io/midu/crun-1.17-2.rhaos4.14.el9.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .

```