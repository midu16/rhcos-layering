

In order to obtain your pull-secret, go to the following [page](https://console.redhat.com/openshift/install/pull-secret).


How to build the layer-kernel: 

```bash
./build_ocp_image.sh /path/to/pull-secret.json 4.16.37 kernel-6.12.4.gtpu.v12-1.x86_64
```

