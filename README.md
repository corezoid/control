## Install

```git clone```

```cd control```


Create namespace if need:
```kubectl create namespace control```

Make changes in `values.yaml` file and run command:
```helm upgrade -i control -n control -f ./values.yaml .```


N.B!
If you update up to chart version `0.3.9`, you need to stop `server` application - just delete deployment for `server`.
After old version of `server` stoped you can upgrade to new chart version.
