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

{{/*
Create the name of the service account to use
*/}}
{{- define "control.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "control.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "control.ingressAnnotations" -}}
kubernetes.io/ingress.class: nginx
nginx.ingress.kubernetes.io/ssl-redirect: "true"
nginx.ingress.kubernetes.io/proxy-body-size: "{{ .Values.global.control.webConfig.maxFileSize }}"
nginx.ingress.kubernetes.io/configuration-snippet: |
      more_set_headers X-Content-Type-Options "nosniff" always;
      more_set_headers X-Frame-Options "SAMEORIGIN" always;
      more_set_headers Referrer-Policy "no-referrer-when-downgrade" always;
      more_set_headers "Content-Security-Policy: default-src 'self' blob: 'unsafe-inline' 'unsafe-eval' data: https://unpkg.com wss://{{ .Values.global.control.domain }} https://{{ .Values.global.control.auth.domain }} https://{{ .Values.global.control.domain }} https://www.google-analytics.com https://fonts.gstatic.com https://www.googletagmanager.com https://*.googleapis.com *.google.com https://*.gstatic.com https://*.corezoid.com https://www.youtube.com https://*.{{ .Values.global.control.mainDomain }} wss://*.{{ .Values.global.control.mainDomain }};";
      if ($request_uri ~ "/index.html") {
        more_set_headers "Cache-Control no-cache";
        more_set_headers "Cache-Control: no-store";
        expires 0;
      }
{{- end }}

{{- define "control.server.annotations" -}}
{{- with .Values.global.control.server.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
{{- end }}

{{- define "control.cron.annotations" -}}
{{- with .Values.global.control.cron.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
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
{{- end }}

{{- define "InitWait.bouncer" -}}
{{- if .Values.global.db.bouncer }}
- name: init-wait-bouncer
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
  command: ["sh", "-c", "until nc -zw1 pgbouncer-service {{ .Values.global.db.bouncer_port }}; do echo waiting for PgBouncer; sleep 2; done;"]
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
{{- end }}
{{- end }}

{{- define "InitWait.redis" -}}
- name: init-wait-redis
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
  command: ["sh", "-c", "until nc -zw1 {{ .Values.global.redis.secret.data.host }} {{ .Values.global.redis.secret.data.port }}; do echo waiting for Redis; sleep 2; done;"]
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
{{- end }}

{{- define "InitWait.pubsubredis" -}}
- name: init-wait-pubsub-redis
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
  command: ["sh", "-c", "until nc -zw1 {{ .Values.global.redis.secret.data.host_PubSub }} {{ .Values.global.redis.secret.data.port_PubSub }}; do echo waiting for Redis_PubSub; sleep 2; done;"]
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
{{- end }}

{{- define "InitWait.elasticsearch" -}}
- name: init-wait-elasticsearch
  image: "{{ .Values.global.imageInit.repository }}:{{ .Values.global.imageInit.tag }}"
  imagePullPolicy: IfNotPresent
  command: ["sh", "-c", "until nc -zw1 {{ .Values.global.elasticsearch.secret.data.host }} {{ .Values.global.elasticsearch.secret.data.port }}; do echo waiting for ElasticSearch; sleep 2; done;"]
  terminationMessagePath: /dev/termination-log
  terminationMessagePolicy: File
{{- end }}

