{{/*
Common labels
*/}}
{{- define "pgbouncer.labels" -}}
{{ include "control.appLabels" . }}
tier: {{ .Values.appName }}
release: {{ .Release.Name }}
chart: {{ include "control.fullname" . }}
{{- end }}
