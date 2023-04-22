# Evaluation of out-of-tree driver installation methods

## Purpose 

In this section we are going to compare DriverToolKit, RHCOS-Layering and KernelModuleManager-Operator from the following perspectives:

- Features
- Cluster resource consumptions
- Lifecycle management
- Cluster impact (i.e downtime, number of restarts, etc)
- Driver made available at cluster install time.

## Prerequisites 

In the implementation we are going to use:
- The [simple-kmod][simple-kmod-link] as a reference driver. This can be replaced with any other driver if the use-case is requiring.
- OCPv4.12.0 
- SNO (SingleNodeOpenShift)

[simple-kmod-link]: https://github.com/openshift-psap/simple-kmod.git

## Environment used

In the further tests a libvirt environment has been used, each node are using the following specifications:
- vCPU: 34
- Memory allocated: 40960MiB
- Root disk: 100GiB
- Application disks:
    - /dev/vdb: 100GiB
    - /dev/vdc: 100GiB
- OCP network type used: OVNKubernetes

## Implementation 

In this section we are going to discuss about the individual tools implementation.

### RHCOS-Layering

In this section we are going to discuss on how to [build][layering-simple-kmod] your `out-of-tree` kernel driver using RHCOS-Layering method.

The [Containerfile][layering-simple-kmod-containerfile] its reffering to two main container base images in your OCP base release, those will be used to produce your custom release which contains the `out-of-tree` kernel driver.



[layering-simple-kmod]: ./layering-simple-kmod/README.md
[layering-simple-kmod-containerfile]: ./layering-simple-kmod/Containerfile

### DriverToolKit

### KMM


## Resources

1. [DriverToolKit][dtk]
2. 
3. 
4. [PauseMCPReboot][disable-reboot]

[dtk]: https://docs.openshift.com/container-platform/4.12/hardware_enablement/psap-driver-toolkit.html

[disable-reboot]: https://access.redhat.com/solutions/5477811