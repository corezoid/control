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

## Grafana dashboards

Dashboards are the files in `mixins/dashboards/*.json`; they are rendered as ConfigMaps (label `grafana_dashboard: "true"`) and picked up by the Grafana sidecar. Manual edits in the Grafana UI are lost on Grafana restart. To change a dashboard (e.g. SIM API, `mixins/dashboards/sim-api.json`, uid `sim_api_dashboard`), open an MR to this chart, not edit it in the UI.
