# KernelModuleManagement-Operator

## Purpose 

In this section we are going to show-case :

- How to build an out-of-tree kernel driver, for this example we have used `simple-kmod`.
- How to apply the out-of-tree kernel driver to your OCP cluster in the following stages:
    - as day2 operation;
    - as day1 operation.

## Prerequisites 

In the implementation we are going to use:
- The [simple-kmod][simple-kmod-link] as a reference driver. This can be replaced with any other driver if the use-case is requiring.
- OCPv4.12.0+
- SNO (SingleNodeOpenShift)
- KMMv1.0.0 

## Resources

1. 

[deploy_kmod]: https://openshift-kmm.netlify.app/documentation/deploy_kmod/

[kmm_operator]: https://docs.openshift.com/container-platform/4.12/hardware_enablement/kmm-kernel-module-management.html