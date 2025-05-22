```bash
export OCP_VERSION="4.14.43"
VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos' | awk -F ' ' '{print $2}')
echo $VARIABLE_NAME
podman build -t quay.io/midu/crun-1.17-2.rhaos4.14.el9.x86_64:${OCP_VERSION} --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
```


- To apply the patch to your OCPv4.14.43 cluster, use the following CR:
```bash
# oc create -f 99-crun-patch-master.yaml
machineconfig.machineconfiguration.openshift.io/crun-patch created
```

- The `crun rpm` version before the change:

```bash
[root@INBACRNRDL0102 ~]# oc debug node/hub-ctlplane-0.5g-deployment.lab -- bash -c 'chroot /host bash -c "rpm -qa | grep crun"'
Starting pod/hub-ctlplane-05g-deploymentlab-debug-wmvft ...
To use host binaries, run `chroot /host`
crun-1.14-1.rhaos4.14.el9.x86_64

Removing debug pod ...
```

- The `crun rpm` version after the change:

```bash
[root@INBACRNRDL0102 ~]# oc debug node/hub-ctlplane-1.5g-deployment.lab -- bash -c 'chroot /host bash -c "rpm -qa | grep crun"'
Starting pod/hub-ctlplane-15g-deploymentlab-debug-md765 ...
To use host binaries, run `chroot /host`
crun-1.17-2.rhaos4.14.el9.x86_64

Removing debug pod ...
```

> NOTE: The current MachineConfig CR wont allow you to upgrade the Cluster OCPv4.14.43 to any version. In order to regain the upgrade capability, ensure to remove the MachineConfig CR and progress with the upgrade.

