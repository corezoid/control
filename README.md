## Install

```git clone```
```cd control```


Create namespace if need:
```kubectl create namespace control```

Make changes in `values.yaml` file and run command:
```helm upgrade -i control -n control -f ./values.yaml .```
