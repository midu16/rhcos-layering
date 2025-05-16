

In order to obtain your pull-secret, go to the following [page](https://console.redhat.com/openshift/install/pull-secret).


How to build the layer-kernel: 

```bash
./build_ocp_image.sh /path/to/pull-secret.json 4.16.37 kernel-6.12.4-0.test.el9_7.x86_64
```

How to apply the layer-kernel:

```bash
oc create -f kernel-6.12.4.gtpu.v12-1.x86_64.yaml 
```

> **NOTE:** Once this MachineConfig CR its applied to the OpenShift 4 Cluster, the MachineConfig Operator will roll-out the new config to the master nodes. Ensure that you are performing these changes on the right MachineConfigPool of your cluster. 

How to verify the changes:

```bash
[root@INBACRNRDL0102 ~]# oc get mcp; oc get nodes
NAME     CONFIG                                             UPDATED   UPDATING   DEGRADED   MACHINECOUNT   READYMACHINECOUNT   UPDATEDMACHINECOUNT   DEGRADEDMACHINECOUNT   AGE
master   rendered-master-0b67d80a7d28a010adde4ff26e62dcb4   False     True       False      3              0                   0                     0                      2d8h
worker   rendered-worker-c7530e72dd15604b4fffa6b73d073451   True      False      False      0              0                   0                     0                      2d8h
NAME                               STATUS                     ROLES                         AGE    VERSION
hub-ctlplane-0.5g-deployment.lab   Ready,SchedulingDisabled   control-plane,master,worker   2d8h   v1.29.14+7cf4c05
hub-ctlplane-1.5g-deployment.lab   Ready                      control-plane,master,worker   2d8h   v1.29.14+7cf4c05
hub-ctlplane-2.5g-deployment.lab   Ready                      control-plane,master,worker   2d8h   v1.29.14+7cf4c05
``` 

> **NOTE:** In the above output the new MachineConfig render its getting applied to the master pool.

```bash
[root@INBACRNRDL0102 ~]# oc debug nodes/hub-ctlplane-0.5g-deployment.lab -- chroot /host uname -r
Starting pod/hub-ctlplane-05g-deploymentlab-debug-qc299 ...
To use host binaries, run `chroot /host`
6.12.4-0.test.el9_7.x86_64

Removing debug pod ...
```

> **NOTE:** In the above output the new kernel has been applied succesfully on the node.
