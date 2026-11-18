# ctrl-ai-hermes

Simulator AI (AI Console) agent runtime: [Hermes](https://github.com/NousResearch/hermes-agent) with sim-api's
`ai-hermes-local` (model gateway, MCP relay, tool hook) and the simulator-ai and corezoid MCP connectors.
ctrl-sim-api is its only client: it runs AI Console turns there (`config.ai`, `runtime: hermes`). Design, limits
and the meaning of every `HERMES_*` variable: sim-api `docs/simulator-ai-architecture.md`, "Розгортання на EKS".

All values are under `global.control.ctrl_ai_hermes` (root `values.yaml`); it is off by default.

## Image and deploy

`{global.imageRegistry}/{repotype | global.repotype}/ctrl-ai-hermes:{tag | appVersion}`. sim-api CI builds it from
`cmd/ai-hermes-local` and sets `.global.control.ctrl_ai_hermes.tag` through `pong/control-deploy`, as for
`ctrl_sim_api`: `develop` → dev (`ctrl/ctrl-ai-hermes:<sha8>`), `main` → pre, release tag → prod
(`public/` and `simulator/ctrl-ai-hermes:<tag>`). On `develop`/`main` it builds and deploys only when the image's sources change (`cmd/ai-hermes-local`, `go.mod`, `go.sum`); otherwise the build is a manual job.

## A stand needs

| Value | |
|---|---|
| `enabled: true` | |
| `env.HERMES_MODEL_UPSTREAM_URL`, `env.HERMES_MODEL` (required), `env.HERMES_JEV_UPSTREAM_URL`, `env.HERMES_ROUTER_MODEL` | the company LiteLLM, models as it names them |
| `env.HERMES_COREZOID_API_URL`, `env.HERMES_COREZOID_ACCOUNT_URL` | the Corezoid the corezoid connector calls |
| `env.HERMES_MODEL_BUDGET_USD` (+ `_WINDOW_HOURS`, default 24) | the gateway's spend fuse |
| `persistence.storageClassName` (required) | **block storage** (EBS, e.g. `ebs-gp3`) — never EFS/NFS: the gateway refuses its lock and exits (`Cannot reserve gateway profiles: unsafe gateway lock owner or type`). Immutable. |
| `secret.name` / `secret.externalSecret.{enabled,remoteKey}` | `LITELLM_API_KEY`, `HERMES_API_KEY`, `HERMES_CREDENTIAL_KEY`; sim-api's IRSA role reads the last two from the same secret |
| `affinity` / `nodeSelector` / `tolerations` | any one set: all three are Hermes' own; none: those of `global.control` |
| `networkPolicy.litellmNamespace` | when LiteLLM runs in the cluster; otherwise it is reached on 443 |
| `replicas` (default 1) | more than one pod only when `ctrl_sim_api.config.ai.hermes.shards` in the same values lists at least as many pods (`sim-ai-hermes-<N>.sim-ai-hermes-headless.<namespace>.svc.cluster.local`), or, when sim-api's `config.ai` is kept elsewhere, with `shardsConfiguredInSimApi: true`; otherwise the chart refuses to render, since the ClusterIP Service would spread a dialog's turns over pods without its history |

The container runs with `allowPrivilegeEscalation: false`, all capabilities dropped and the `RuntimeDefault`
seccomp profile (`securityContext`, `podSecurityContext`). It stays root: the gateway accepts its profile lock only
when the process uid owns it, and the volume's files are root's; running as another uid needs them re-owned first.

and sim-api's `ctrl_sim_api.config.ai` pointing at it: `hermes.origin http://sim-ai-hermes.<namespace>.svc.cluster.local:8642`,
`spendUrl`/`runCredentialUrl` on `:8643`, `allowClusterHttp: true`.

## Taking over a running `sim-ai-hermes`

The StatefulSet, Services, NetworkPolicy, ServiceMonitor and ExternalSecret keep the names of the raw manifests
the stands ran before (`sim-ai-hermes`, `sim-ai-hermes-headless`, `sim-ai-hermes-env`), and the StatefulSet keeps its
immutable fields (selector `app: sim-ai-hermes`, `serviceName`, `volumeClaimTemplates` `state`). Values that match
the old manifest (same storage class and size) let the chart adopt the objects in place: the PVC
`state-sim-ai-hermes-0` — dialogs' history and the spend ledger — stays, the pod restarts once for its new labels.
Before the chart's Argo application syncs them, the old application must stop owning them: drop its
`resources-finalizer.argocd.argoproj.io` and automated sync first, then delete it (it then leaves the objects).
