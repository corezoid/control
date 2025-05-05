{{/*
Common labels
*/}}
{{- define "server.labels" -}}
{{ include "control.appLabels" . }}
tier: {{ .Values.appName | quote }}
release: {{ .Release.Name | quote }}
api: "true"
chart: {{ include "control.fullname" . | quote }}
{{- end }}

{{- define "server.port" -}}
{{- default .Values.global.control.serverPort .Values.serverPort }}
{{- end }}

{{/*
Image url
*/}}
{{- define "server.imageUrl" -}}
{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.server.tag | default .Chart.AppVersion }}
{{- end }}

{{- define "control.server.annotations" -}}
{{- with .Values.global.control.server.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
{{- end }}

{{/*
Readiness
*/}}
{{- define "server.readiness" -}}
readinessProbe:
  httpGet:
{{- if .Values.global.control.http2 }}
    scheme: HTTPS
{{- else }}
    scheme: HTTP
{{- end }}
    path: /api/sa/1.0/check/readiness
    port: {{ include "server.port" . }}
  initialDelaySeconds: 20
  periodSeconds: 5
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}

{{/*
Liveness
*/}}
{{- define "server.liveness" -}}
livenessProbe:
  tcpSocket:
    port: {{ include "server.port" . }}
  initialDelaySeconds: 25
  periodSeconds: 10
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}


{{- define "control.server.db.pool" -}}
{{- if .Values.global.control.server.config -}}
{{- if .Values.global.control.server.config.db -}}
{{- if .Values.global.control.server.config.db.pool -}}
{{- with .Values.global.control.server.config.db.pool -}}
pool: {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
{{- end -}}
{{- else }}
{{- with .Values.server.config.db.pool -}}
pool: {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
{{- end -}}

{{- define "control.server.redis.pool" -}}
{{- if .Values.global.control.server.config -}}
{{- if .Values.global.control.server.config.redis -}}
{{- if .Values.global.control.server.config.redis.pool -}}
{{- with .Values.global.control.server.config.redis.pool -}}
pool:
  min: {{ .min | default 5 }}
  max: {{ .max | default 200 }}
  idle: {{ .idle | default 30000 }}
{{- end }}
{{- else }}
pool:
  min: 5
  max: 200
  idle: 30000
{{- end -}}
{{- end -}}
{{- else }}
pool:
  min: 5
  max: 200
  idle: 30000
{{- end -}}
{{- end -}}

{{- define "control.server.redisPubSub.pool" -}}
{{- if .Values.global.control.server.config -}}
{{- if .Values.global.control.server.config.redis -}}
{{- if .Values.global.control.server.config.redis.pool -}}
{{- with .Values.global.control.server.config.redis.pool -}}
pool:
  min: {{ .min | default 5 }}
  max: {{ .max | default 200 }}
  idle: {{ .idle | default 30000 }}
{{- end }}
{{- else }}
pool:
  min: 5
  max: 200
  idle: 30000
{{- end -}}
{{- end -}}
{{- else }}
pool:
  min: 5
  max: 200
  idle: 30000
{{- end -}}
{{- end -}}
