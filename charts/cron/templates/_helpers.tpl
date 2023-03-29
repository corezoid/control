{{/*
Common labels
*/}}
{{- define "cron.labels" -}}
{{ include "control.appLabels" . }}
tier: {{ .Values.appName | quote }}
release: {{ .Release.Name | quote }}
cron: "true"
chart: {{ include "control.fullname" . }}
{{- end }}

{{/*
Image url
*/}}
{{- define "cron.imageUrl" -}}
{{ .Values.image.registry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.server.tag | default .Chart.AppVersion }}
{{- end }}

{{- define "control.cron.annotations" -}}
{{- with .Values.global.control.cron.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
{{- end }}

{{/*
Readiness
*/}}
{{- define "cron.readiness" -}}
readinessProbe:
  httpGet:
    scheme: HTTP
    path: /api/sa/1.0/check/readiness
    port: {{ .Values.global.control.cronPort }}
  initialDelaySeconds: 10
  periodSeconds: 5
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}

{{/*
Liveness
*/}}
{{- define "cron.liveness" -}}
livenessProbe:
  tcpSocket:
    port: {{ .Values.global.control.cronPort }}
  initialDelaySeconds: 15
  periodSeconds: 10
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}

{{- define "control.cron.db.pool" -}}
{{- if .Values.global.control.cron.config -}}
{{- if .Values.global.control.cron.config.db -}}
{{- if .Values.global.control.cron.config.db.pool -}}
{{- with .Values.global.control.cron.config.db.pool -}}
pool: {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
{{- end -}}
{{- else }}
{{- with .Values.cron.config.db.pool -}}
pool: {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
{{- end -}}
