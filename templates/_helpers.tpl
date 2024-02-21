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
{{- if .Values.global.control.ingress.tls }}
cert-manager.io/cluster-issuer: letsencrypt
{{- end }}
{{- if (semverCompare ">=1.24-0" .Capabilities.KubeVersion.GitVersion) }}
ingress.class: {{ .Values.global.control.ingress.className }}
{{- end }}
prometheus.io/scrape: "true"
prometheus.io/port: "9113"
prometheus.io/scheme: http
{{- if and .Values.global.control.ingress.className (semverCompare "<=1.23-0" .Capabilities.KubeVersion.GitVersion) }}
{{- if not .Values.global.argocd_deploy }}
kubernetes.io/ingress.class: {{ .Values.global.control.ingress.className }}
{{- end }}
{{- end }}
nginx.ingress.kubernetes.io/ssl-redirect: "true"
nginx.ingress.kubernetes.io/proxy-body-size: "{{ .Values.global.control.webConfig.maxFileSize }}"
nginx.ingress.kubernetes.io/enable-cors: "true"
nginx.ingress.kubernetes.io/cors-expose-headers: "*"
{{- end }}

{{- define "control.nginx.add_header.cors" -}}
# CORS headers
add_header Content-Security-Policy "default-src 'self' blob: 'unsafe-inline' 'unsafe-eval' data: https://unpkg.com wss://{{- include "control.Domain" . }} https://{{ .Values.global.control.auth.domain }} https://*.control.events https://{{- include "control.Domain" . }} https://simulator.company https://www.google-analytics.com https://fonts.gstatic.com https://www.googletagmanager.com https://*.googleapis.com *.google.com https://*.gstatic.com https://*.corezoid.com https://frames.a-bank.com.ua https://www.youtube.com wss://global.vss.twilio.com wss://*.twilio.com wss://sdkgw.us1.twilio.com wss://*.onfido.com https://*.onfido.com https://*.sentry.io https://*.sardine.ai https://*.linkedin.com https://www.facebook.com https://*.doubleclick.net https://cdn.linkedin.oribi.io https://snap.licdn.com https://connect.facebook.net https://*.hotjar.com https://*.{{ .Values.global.domain }} wss://*.{{ .Values.global.domain }}{{ if .Values.global.control.apiOld -}}{{- if .Values.global.control.apiOld.enabled }} https://*.{{ .Values.global.control.apiOld.mainDomain }} https://{{ .Values.global.control.apiOld.mainDomain }}{{- end -}}{{- end -}};" always;
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

{{- define "control.redisSecretName" -}}
{{- .Release.Name }}-control-{{ .Values.global.redis.secret.name }}
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
