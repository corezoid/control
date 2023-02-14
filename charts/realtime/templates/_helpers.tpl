{{/*
Common labels
*/}}
{{- define "realtime.labels" -}}
{{ include "control.appLabels" . }}
tier: {{ .Values.appName }}
release: {{ .Release.Name }}
{{- end }}

{{/*
Image url
*/}}
{{- define "realtime.imageUrl" -}}
{{ .Values.image.registry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.realtime.tag | default .Chart.AppVersion }}
{{- end }}