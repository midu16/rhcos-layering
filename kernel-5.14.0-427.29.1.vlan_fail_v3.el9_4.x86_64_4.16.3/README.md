# case-03873728


## Building the layer kernel for this case:

- Steps for OCPv4.16.0:

```bash
$ export OCP_VERSION="4.16.0"
$ VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos' | awk -F ' ' '{print $2}'); echo $VARIABLE_NAME
$ podman build -t kernel-5.14.0-427.29.1.vlan_fail_v3.el9_4.x86_64:latest --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
$ podman tag localhost/kernel-5.14.0-427.29.1.vlan_fail_v3.el9_4.x86_64:latest quay.io/midu/kernel-5.14.0-427.29.1.vlan_fail_v3.el9_4.x86_64:${OCP_VERSION}
$ podman push quay.io/midu/kernel-5.14.0-427.29.1.vlan_fail_v3.el9_4.x86_64:${OCP_VERSION}
```

- Steps for OCPv4.16.3:
```bash
$ export OCP_VERSION="4.16.3"
$ VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos' | awk -F ' ' '{print $2}'); echo $VARIABLE_NAME
$ podman build -t kernel-5.14.0-427.29.1.vlan_fail_v3.el9_4.x86_64:latest --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
$ podman tag localhost/kernel-5.14.0-427.29.1.vlan_fail_v3.el9_4.x86_64:latest quay.io/midu/kernel-5.14.0-427.29.1.vlan_fail_v3.el9_4.x86_64:${OCP_VERSION}
$ podman push quay.io/midu/kernel-5.14.0-427.29.1.vlan_fail_v3.el9_4.x86_64:${OCP_VERSION}
```

