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

## Optional hardening (AWS Marketplace profile)

All of these are off by default; with the shipped `values.yaml` the chart renders exactly as before.

### Platform secrets from an existing Secret (`global.control.existingSecret`)

By default `apiSecret`, `superAdminApiKey`, `auth.key` and the app DB password
(`global.db.secret.data.dbpwd`) are taken from values and rendered into the server and
ctrl-sim-api ConfigMaps (and plain env of the init containers). To keep them out of
values and ConfigMaps, create a Secret and point the chart at it:

```bash
kubectl -n control create secret generic control-platform \
  --from-literal=apiSecret=<...> \
  --from-literal=superAdminApiKey=<...> \
  --from-literal=saSecretKey=<...> \
  --from-literal=dbpwd=<...>
```

```yaml
global:
  control:
    existingSecret:
      name: control-platform
      keys:                      # optional, these are the defaults
        apiSecret: apiSecret
        superAdminApiKey: superAdminApiKey
        authKey: saSecretKey
        dbPassword: dbpwd
```

With `name` set:

- server and ctrl-sim-api get `CONTROL_API_SECRET`, `CONTROL_SUPERADMIN_API_KEY`,
  `CONTROL_SA_SECRET_KEY` and `CONTROL_DB_PASSWORD` as `secretKeyRef` env vars, and their
  config files contain only the `${...}` placeholders;
- control-tasks builds `CONTROL_TOKEN` from the Secret (`<superAdminApiKeyPrifix>$(CONTROL_SUPERADMIN_API_KEY)`)
  and reads `CONFIG_SA_SECRETKEY` from it; `configSaSecretKey` is no longer written to
  `control-config-secret`;
- `DB_PASSWORD`, the `PGPASSWORD` of the init containers, pgbouncer and the
  `postgres-post-install` hook read the DB password from the Secret.

Still needed separately: `global.db.secret.create: false` with a pre-created
`<release>-control-<db.secret.name>` / `-root` Secret if the DB Secret must not be rendered
from values either. ufs and mf-api (both optional, off by default) still read `auth.key`
from values.

### Init / hook container resources (`global.control.initResources`)

```yaml
global:
  control:
    initResources:
      requests: {cpu: 10m, memory: 16Mi}
      limits: {cpu: 100m, memory: 64Mi}
```

Applied to every `InitWait.*` init container, the `postgres-post-install` hook Pod and the
ufs / internal postgres / internal scylla init containers.

### PodDisruptionBudgets and extra HPAs

- `global.control.<server|frontend|realtime|widget|ctrl_sim_api|control_tasks>.pdb.enabled: true`
  renders a `policy/v1` PDB (`minAvailable: 1` by default; set `maxUnavailable` to use it
  instead — recommended for the single-replica control-tasks).
- `global.control.<widget|ctrl_sim_api|control_tasks>.autoscaling.createHPA: true` together
  with `autoscaling.enabled: true` renders an `autoscaling/v2` HPA for components that had
  no HPA template. `createHPA` is separate so installs that already set `enabled: true`
  do not get a new HPA on upgrade. control-tasks is a singleton by design (keep `maxReplicas: 1`
  unless its cron locking has been confirmed).
