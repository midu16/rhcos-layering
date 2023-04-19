# How to build the runc container-base image patch

This needs to be updated according to each OCP release version as follows:

```bash
export OCP_VERSION="4.12.0"
curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos-8' | awk -F ' ' '{print $2}'
```

# How to patch the crio using day2-machine config

## How to build the container-base images:

```bash
$ export OCP_VERSION="4.12.0"
$ VARIABLE_NAME=$(curl -s https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OCP_VERSION/release.txt | grep -m1 'rhel-coreos-8' | awk -F ' ' '{print $2}')
$ podman build -t runc-patch:latest --no-cache --build-arg rhel_coreos_release=${VARIABLE_NAME} .
$ podman tag localhost/runc-patch:latest quay.io/midu/runc-patch:4.12.0
$ podman push quay.io/midu/runc-patch:4.12.0
```
! Note: Please, be aware that you can push this image to your internal offline registry and make use of it from there. If you want to build the image for another OCP release, simply replace the `OCP_VERSION` to the required release and update the tag further on.

## Publically available image:

```bash
$ podman pull quay.io/midu/runc-patch:4.12.0
```

## How to use the image in OCP using machine-config:


### Before changes:
- In OCPv4.12.0:
```bash
[core@someone-test-ctlplane-0 ~]$ runc --version
runc version 1.1.2
spec: 1.0.2-dev
go: go1.19.4
libseccomp: 2.5.2
```

### Applying the changes:
```bash
$ oc create -f runc-patch-master.yaml
machineconfig.machineconfiguration.openshift.io/runc-patch created
$ oc get mc
NAME                                               GENERATEDBYCONTROLLER                      IGNITIONVERSION   AGE
00-master                                          2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
00-worker                                          2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
01-container-mount-ns-and-kubelet-conf-master                                                 3.2.0             32h
01-master-container-runtime                        2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
01-master-kubelet                                  2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
01-worker-container-runtime                        2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
01-worker-kubelet                                  2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
02-masters-workload-partitioning                                                              3.2.0             32h
04-accelerated-container-startup-master                                                       3.2.0             32h
99-master-fips                                                                                3.2.0             32h
99-master-generated-registries                     2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
99-master-ssh                                                                                 3.2.0             32h
99-masters-disable-crio-wipe                                                                  2.2.0             32h
99-worker-fips                                                                                3.2.0             32h
99-worker-generated-registries                     2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
99-worker-ssh                                                                                 3.2.0             32h
rendered-master-ccb964c536d88182185ee9bb46194e1c   2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             2s
rendered-master-fdb6a034a0c54e64cccaf1e2ae9d857d   2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
rendered-worker-d94c1a786bd3fb180e698325efb75c29   2b3eba74dd9e4371f35ab41dbda02642f60707ec   3.2.0             32h
runc-patch                                                                                                      7s
$ oc get mcp
NAME     CONFIG                                             UPDATED   UPDATING   DEGRADED   MACHINECOUNT   READYMACHINECOUNT   UPDATEDMACHINECOUNT   DEGRADEDMACHINECOUNT   AGE
master   rendered-master-fdb6a034a0c54e64cccaf1e2ae9d857d   False     True       False      1              0                   0                     0                      32h
worker   rendered-worker-d94c1a786bd3fb180e698325efb75c29   True      False      False      0              0                   0                     0                      32h
```

### After changes:
- In OCPv4.12.0 + machine-config applied:
```bash
$ runc --version
runc version 1.1.6
spec: 1.0.2-dev
go: go1.19.6
libseccomp: 2.5.2
```

You can see that the `runc` version has been updated.