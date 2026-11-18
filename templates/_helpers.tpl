{{/*
Expand the name of the chart.
*/}}
{{- define "control.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "control.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "control.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}




{{/*
Common labels
*/}}
{{- define "control.labels" -}}
helm.sh/chart: {{ include "control.chart" . }}
{{ include "control.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Create application name label.
*/}}
{{- define "control.appLabels" -}}
app: {{ .Values.global.control.product | quote }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "control.selectorLabels" -}}
app.kubernetes.io/name: {{ include "control.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{- define "control.ingressAnnotations" -}}
{{- if .Values.global.control.ingress.tls }}
cert-manager.io/cluster-issuer: letsencrypt
{{- end }}
{{- if (semverCompare ">=1.24-0" .Capabilities.KubeVersion.GitVersion) }}
ingress.class: {{ .Values.global.control.ingress.className }}
{{- end }}
prometheus.io/scrape: "true"
prometheus.io/port: "9113"
prometheus.io/scheme: http
{{ if .Values.global.control.ingress.annotations -}}
{{ toYaml .Values.global.control.ingress.annotations }}
{{ end -}}
{{- if and .Values.global.control.ingress.className (semverCompare "<=1.23-0" .Capabilities.KubeVersion.GitVersion) }}
{{- if not .Values.global.argocd_deploy }}
kubernetes.io/ingress.class: {{ .Values.global.control.ingress.className }}
{{- end }}
{{- end }}
nginx.ingress.kubernetes.io/ssl-redirect: "true"
nginx.ingress.kubernetes.io/proxy-body-size: "{{ .Values.global.control.webConfig.maxFileSize }}"
nginx.ingress.kubernetes.io/enable-cors: "true"
nginx.ingress.kubernetes.io/cors-expose-headers: "*"
# The value REPLACES the nginx default wholesale, so every header a browser may send on a
# cross-origin request must be listed or its preflight fails. X-App-Tab-Id is sent on EVERY
# JSON-RPC call by the runtime SPA and X-App-Packet-Id on mutating ones
# (simulator-ui-kit packages/sim-api/src/transport/client.ts); without them cross-origin
# runtime traffic is blocked by the browser even though curl (which skips preflight) works.
# X-Request-ID / X-CSRF-Token are already accepted by the apps themselves. CE-15811.
# Control-Client: control-widget names itself on every API request (control-client: widget).
nginx.ingress.kubernetes.io/cors-allow-headers: "DNT,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range,Authorization,X-App-Client,X-App-Platform,X-App-Device-Id,X-App-Version,X-App-Tab-Id,X-App-Packet-Id,X-Request-ID,X-CSRF-Token,Control-Client"
{{- end }}

{{- define "control.nginx.add_header.cors" -}}
# CORS headers
add_header Content-Security-Policy "default-src 'self' blob: 'unsafe-inline' 'unsafe-eval' data: {{- range .Values.global.control.content_security_policy.urls }} {{.}}{{- end }} https://unpkg.com wss://{{- include "control.Domain" . }} https://{{ .Values.global.control.auth.domain }} https://*.control.events https://{{- include "control.Domain" . }} https://simulator.company https://www.google-analytics.com https://fonts.gstatic.com https://www.googletagmanager.com https://*.googleapis.com *.google.com https://*.gstatic.com https://*.corezoid.com https://*.on.aws https://*.ngrok-free.app https://frames.a-bank.com.ua https://www.youtube.com wss://global.vss.twilio.com wss://*.twilio.com wss://sdkgw.us1.twilio.com wss://*.onfido.com https://*.onfido.com https://*.sentry.io https://*.sardine.ai https://*.linkedin.com https://www.facebook.com https://*.doubleclick.net https://cdn.linkedin.oribi.io https://snap.licdn.com https://*.my.connect.aws https://connect.facebook.net https://*.hotjar.com https://*.{{ .Values.global.domain }} wss://*.{{ .Values.global.domain }}{{ if .Values.global.control.apiOld -}}{{- if .Values.global.control.apiOld.enabled }} https://*.{{ .Values.global.control.apiOld.mainDomain }} https://{{ .Values.global.control.apiOld.mainDomain }}{{- end -}}{{- end -}};" always;
{{- end }}

{{- define "control.nginx.add_header" -}}
# security headers
add_header X-XSS-Protection "1; mode=block" always;
add_header X-Content-Type-Options "nosniff" always;
#add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-Real-IP $remote_addr always;
add_header X-Forwarded-For $http_x_forwarded_for always;
add_header X-Content-Type-Options nosniff;
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
add_header Referrer-Policy "no-referrer-when-downgrade" always;
{{- end }}

{{/*
Create block for init-wait containers
*/}}
{{- define "InitWait.postgres" -}}
- name: init-wait-postgresql
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
  command: ["sh", "-c", "until nc -zw1 {{ .Values.global.db.secret.data.dbhost }} {{ .Values.global.db.secret.data.dbport }}; do echo waiting for PostgeSQL; sleep 2; done;"]
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}
{{- end }}

{{- define "InitWait.postgres-extension-postgis" -}}
- name: init-wait-postgresql-extension-postgis
  image: "{{ .Values.global.db.image }}"
  imagePullPolicy: IfNotPresent
  env:
    {{- if include "control.existingSecretName" . }}
    {{- include "control.existingSecretEnv" (list . "PGPASSWORD" "dbPassword") | nindent 4 }}
    {{- else }}
    - name: PGPASSWORD
      value: "{{ .Values.global.db.secret.data.dbpwd }}"
    {{- end }}
  command:
    - sh
    - -c
    - >
      until psql -h {{ .Values.global.db.secret.data.dbhost }} \
                 -p {{ .Values.global.db.secret.data.dbport }} \
                 -U {{ .Values.global.db.secret.data.dbuser }} \
                 -d {{ .Values.global.control.dbname | default "control" }} \
                 -c "SELECT 1 FROM pg_extension WHERE extname = 'postgis';" | grep -q 1;
      do
        echo "Waiting for PostGIS extension to be available...";
        sleep 2;
      done;
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}
{{- end }}

{{- define "InitWait.postgres-extension-btree-gin" -}}
- name: init-wait-postgresql-extension-btree-gin
  image: "{{ .Values.global.db.image }}"
  imagePullPolicy: IfNotPresent
  env:
    {{- if include "control.existingSecretName" . }}
    {{- include "control.existingSecretEnv" (list . "PGPASSWORD" "dbPassword") | nindent 4 }}
    {{- else }}
    - name: PGPASSWORD
      value: "{{ .Values.global.db.secret.data.dbpwd }}"
    {{- end }}
  command:
    - sh
    - -c
    - >
      until psql -h {{ .Values.global.db.secret.data.dbhost }} \
                 -p {{ .Values.global.db.secret.data.dbport }} \
                 -U {{ .Values.global.db.secret.data.dbuser }} \
                 -d {{ .Values.global.control.dbname | default "control" }} \
                 -c "SELECT 1 FROM pg_extension WHERE extname = 'btree_gin';" | grep -q 1;
      do
        echo "Waiting for btree_gin extension to be available...";
        sleep 2;
      done;
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}
{{- end }}

{{- define "InitWait.postgres-extension-pg-trgm" -}}
- name: init-wait-postgresql-extension-pg-trgm
  image: "{{ .Values.global.db.image }}"
  imagePullPolicy: IfNotPresent
  env:
    {{- if include "control.existingSecretName" . }}
    {{- include "control.existingSecretEnv" (list . "PGPASSWORD" "dbPassword") | nindent 4 }}
    {{- else }}
    - name: PGPASSWORD
      value: "{{ .Values.global.db.secret.data.dbpwd }}"
    {{- end }}
  command:
    - sh
    - -c
    - >
      until psql -h {{ .Values.global.db.secret.data.dbhost }} \
                 -p {{ .Values.global.db.secret.data.dbport }} \
                 -U {{ .Values.global.db.secret.data.dbuser }} \
                 -d {{ .Values.global.control.dbname | default "control" }} \
                 -c "SELECT 1 FROM pg_extension WHERE extname = 'pg_trgm';" | grep -q 1;
      do
        echo "Waiting for pg_trgm extension to be available...";
        sleep 2;
      done;
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}
{{- end }}

{{- define "InitWait.bouncer" -}}
{{- if .Values.global.db.bouncer }}
- name: init-wait-bouncer
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
  command: ["sh", "-c", "until nc -zw1 {{ include "pgbouncer.service.name" . }} {{ .Values.global.db.bouncer_port }}; do echo waiting for PgBouncer; sleep 2; done;"]
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}
{{- end }}
{{- end }}

{{- define "InitWait.redis" -}}
- name: init-wait-redis
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
{{- if .Values.global.control.redis }}
  command: ["sh", "-c", "until nc -zw1 {{ .Values.global.control.redis.secret.data.host }} {{ .Values.global.control.redis.secret.data.port }}; do echo waiting for Redis; sleep 2; done;"]
{{- else }}
  command: ["sh", "-c", "until nc -zw1 {{ .Values.global.redis.secret.data.host }} {{ .Values.global.redis.secret.data.port }}; do echo waiting for Redis; sleep 2; done;"]
{{- end }}
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}
{{- end }}

{{- define "InitWait.pubsubredis" -}}
- name: init-wait-pubsub-redis
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
{{- if .Values.global.control.redis }}
{{- if .Values.global.control.redis.internal }}
  command: ["sh", "-c", "until nc -zw1 {{ .Values.global.control.redis.secret.data.host }} {{ .Values.global.control.redis.secret.data.port }}; do echo waiting for Redis; sleep 2; done;"]
{{- else }}
  command: ["sh", "-c", "until nc -zw1 {{ .Values.global.redis.secret.data.host_PubSub }} {{ .Values.global.redis.secret.data.port_PubSub }}; do echo waiting for Redis_PubSub; sleep 2; done;"]
{{- end }}
{{- end }}
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}
{{- end }}

{{- define "InitWait.scylla" -}}
- name: init-wait-scylla-resolve
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
  command: ["sh"]
  args:
    - "-c"
    - |
      if ! echo ${SCYLLADB_HOST} | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'; then
        until IP=$(nslookup ${SCYLLADB_HOST} 2>/dev/null | grep "Address: " | sed 's/.*: //g;s/ .*//g'); [ -n "$IP" ]; do
          echo "Waiting for Database IP resolution";
          sleep 2;
        done
      else
        echo "${SCYLLADB_HOST} is already an IP address, skipping resolution.";
      fi
  env:
    - name: SCYLLADB_HOST
      {{- if .Values.global.control.scylladb.internal }}
      value: "scylla-service"
      {{- else }}
      value: "{{- index .Values.global.control.scylladb.contactPoints 0 }}"
      {{- end }}
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}

- name: init-wait-scylla
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
  command: ["sh", "-c", "until nc -zw1 {{ if .Values.global.control.scylladb.internal }}scylla-service{{ else }}{{ index .Values.global.control.scylladb.contactPoints 0 }}{{ end }} 9042; do echo Waiting for ScyllaDB to be ready...; sleep 5; done;"]
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}
{{- end }}


{{- define "control.Domain" -}}
{{- .Values.global.control.controlSubDomain }}.{{ .Values.global.domain }}
{{- end -}}

{{- define "control.WidgetDomain" -}}
{{- .Values.global.control.widgetSubDomain | default "widget" }}.{{ .Values.global.domain }}
{{- end -}}

{{- define "control.ApiDomain" -}}
{{- if .Values.global.control.apiSubDomain -}}
{{- .Values.global.control.apiSubDomain }}.{{ .Values.global.domain }}
{{- end -}}
{{- end -}}


{{- define "common.ServiceMonitor.apiVersion" -}}
monitoring.coreos.com/v1
{{- end -}}

{{- define "common.ServiceMonitor.metadata.labes" -}}
simulator.observability/scrape: "true"
{{- end -}}

{{- define "control.postgresSecretName" -}}
{{- .Release.Name }}-control-{{ .Values.global.db.secret.name }}
{{- end -}}

{{- define "control.postgresSecretNameRoot" -}}
{{- .Release.Name }}-control-{{ .Values.global.db.secret.name }}-root
{{- end -}}

{{- define "control.postgresSecretAnnotations" -}}
{{ if .Values.global.control.secret -}}
{{ if .Values.global.control.secret.postgres -}}
{{ if .Values.global.control.secret.postgres.annotations -}}
{{ toYaml .Values.global.control.secret.postgres.annotations }}
{{ end -}}
{{ end -}}
{{ end -}}
{{- end }}

{{/* P-SIM-2: pre-created Redis/ElastiCache Secret (keys host, port, password, + *_PubSub etc. as in secret.data) */}}
{{- define "control.redisExistingSecret" -}}
{{- if .Values.global.control.redis -}}
{{- dig "secret" "existingSecretName" "" (.Values.global.control.redis | toYaml | fromYaml) -}}
{{- else -}}
{{- dig "secret" "existingSecretName" "" ((.Values.global.redis | default dict) | toYaml | fromYaml) -}}
{{- end -}}
{{- end -}}

{{- define "control.redisSecretName" -}}
{{- if include "control.redisExistingSecret" . }}
{{- include "control.redisExistingSecret" . }}
{{- else if .Values.global.control.redis }}
{{- .Release.Name }}-control-{{ .Values.global.control.redis.secret.name }}
{{- else }}
{{- .Release.Name }}-control-{{ .Values.global.redis.secret.name }}
{{- end }}
{{- end -}}

{{- define "control.scyllaSecretName" -}}
{{- .Release.Name }}-control-scylla-secret
{{- end -}}

{{- define "control.redisSecretAnnotations" -}}
{{ if .Values.global.control.secret -}}
{{ if .Values.global.control.secret.redis -}}
{{ if .Values.global.control.secret.redis.annotations -}}
{{ toYaml .Values.global.control.secret.redis.annotations }}
{{ end -}}
{{ end -}}
{{ end -}}
{{- end }}

{{- define "control.configSecretAnnotations" -}}
{{ if .Values.global.control.secret -}}
{{ if .Values.global.control.secret.config -}}
{{ if .Values.global.control.secret.config.annotations -}}
{{ toYaml .Values.global.control.secret.config.annotations }}
{{ end -}}
{{ end -}}
{{ end -}}
{{- end }}

{{- define "control.configSecretName" -}}
control-config-secret
{{- end -}}

{{- define "control.realtime.app_port" -}}
{{ .Values.global.control.realtimePort | default 9005 }}
{{- end -}}


{{- define "pgbouncer.service.name" -}}
pgbouncer-control-service
{{- end }}

{{- define "InitWait.postgres-extension-vector" -}}
- name: init-wait-postgresql-extension-vector
  image: "{{ .Values.global.db.image }}"
  imagePullPolicy: IfNotPresent
  env:
    {{- if include "control.existingSecretName" . }}
    {{- include "control.existingSecretEnv" (list . "PGPASSWORD" "dbPassword") | nindent 4 }}
    {{- else }}
    - name: PGPASSWORD
      value: "{{ .Values.global.db.secret.data.dbpwd }}"
    {{- end }}
  command:
    - sh
    - -c
    - >
      until psql -h {{ .Values.global.db.secret.data.dbhost }} \
                 -p {{ .Values.global.db.secret.data.dbport }} \
                 -U {{ .Values.global.db.secret.data.dbuser }} \
                 -d {{ .Values.global.control.dbname | default "control" }} \
                 -c "CREATE EXTENSION IF NOT EXISTS vector;" \
                 -c "SELECT 1 FROM pg_extension WHERE extname = 'vector';" | grep -q 1;
      do
        echo "Creating/waiting for vector extension to be available...";
        sleep 2;
      done;
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
  {{- include "control.initResources" (list . 2) }}
{{- end }}

{{/*
control.initResources (list ctx indent) -- MARKETPLACE CH-01.
`resources:` for the chart's init and hook containers, from
global.control.initResources. Emits NOTHING (not even a newline) while the value
is empty, which is the default, so the stock render is byte-identical.
Usage, as the last line of a container at indent N:
  {{- include "control.initResources" (list . N) }}
*/}}
{{- define "control.initResources" -}}
{{- $ctx := index . 0 -}}
{{- $r := ($ctx.Values.global.control | default dict).initResources -}}
{{- if $r -}}
{{- printf "\n%s" (printf "resources:\n%s" (toYaml $r | indent 2) | indent (int (index . 1))) -}}
{{- end -}}
{{- end -}}

{{/*
control.pdb (dict "ctx" . "data" <component values> "labels" <selector labels>)
-- MARKETPLACE CH-03. Optional PodDisruptionBudget for one component, rendered
only when <component>.pdb.enabled is true (default false). maxUnavailable, when
set, wins over minAvailable (default 1). The selector is the component
Deployment's own matchLabels.
*/}}
{{- define "control.pdb" -}}
{{- $ctx := .ctx -}}
{{- $pdb := (.data | default dict).pdb | default dict -}}
{{- if $pdb.enabled }}
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: {{ $ctx.Values.appName }}-pdb
  labels:
{{- .labels | nindent 4 }}
spec:
  {{- if hasKey $pdb "maxUnavailable" }}
  maxUnavailable: {{ $pdb.maxUnavailable }}
  {{- else }}
  minAvailable: {{ $pdb.minAvailable | default 1 }}
  {{- end }}
  selector:
    matchLabels:
{{- .labels | nindent 6 }}
{{- end }}
{{- end -}}

{{/*
control.hpa (dict "ctx" . "data" <component values> "labels" <labels>)
-- MARKETPLACE CH-03. autoscaling/v2 HPA for components that had none (widget,
ctrl-sim-api, control-tasks). Rendered only when BOTH <component>.autoscaling.enabled
and <component>.autoscaling.createHPA are true. createHPA defaults to false so an
install that already sets autoscaling.enabled (and maybe manages its own HPA)
does not get a second one on upgrade.
*/}}
{{- define "control.hpa" -}}
{{- $ctx := .ctx -}}
{{- $a := (.data | default dict).autoscaling | default dict -}}
{{- if and $a.enabled $a.createHPA }}
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ $ctx.Values.appName }}-autoscale
  labels:
{{- .labels | nindent 4 }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ $ctx.Values.appName }}-deployment
  minReplicas: {{ $a.minReplicas | default 1 }}
  maxReplicas: {{ $a.maxReplicas | default 2 }}
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: {{ $a.targetCPUUtilizationPercentage | default 80 }}
    {{- with $a.targetMemoryUtilizationPercentage }}
    - type: Resource
      resource:
        name: memory
        target:
          type: Utilization
          averageUtilization: {{ . }}
    {{- end }}
{{- end }}
{{- end -}}

{{/*
MARKETPLACE SEC-07 -- platform secrets from a pre-created Secret
(global.control.existingSecret, see values.yaml). All three helpers are inert
while existingSecret.name is empty (the default).
  control.existingSecretName  ctx                -> "" or the Secret name
  control.existingSecretKey   (list ctx "<id>")  -> key in that Secret; <id> is
                              apiSecret | superAdminApiKey | authKey | dbPassword
  control.existingSecretEnv   (list ctx "<ENV>" "<id>") -> one env entry (indent 0)
*/}}
{{- define "control.existingSecretName" -}}
{{- (($.Values.global.control.existingSecret | default dict).name) | default "" -}}
{{- end -}}

{{- define "control.existingSecretKey" -}}
{{- $ctx := index . 0 -}}
{{- $id := index . 1 -}}
{{- $defaults := dict "apiSecret" "apiSecret" "superAdminApiKey" "superAdminApiKey" "authKey" "saSecretKey" "dbPassword" "dbpwd" "corezoidApiSecret" "corezoidApiSecret" -}}
{{- $keys := (($ctx.Values.global.control.existingSecret | default dict).keys | default dict) -}}
{{- index $keys $id | default (index $defaults $id) -}}
{{- end -}}

{{- define "control.existingSecretEnv" -}}
{{- $ctx := index . 0 -}}
- name: {{ index . 1 }}
  valueFrom:
    secretKeyRef:
      name: {{ include "control.existingSecretName" $ctx }}
      key: {{ include "control.existingSecretKey" (list $ctx (index . 2)) }}
{{- end -}}
