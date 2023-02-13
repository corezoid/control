{{/*
Common labels
*/}}
{{- define "widget.labels" -}}
{{ include "control.appLabels" . }}
tier: {{ .Values.appName }}
release: {{ .Release.Name }}
chart: {{ include "control.fullname" . }}
{{- end }}

{{/*
Image url
*/}}
{{- define "widget.imageUrl" -}}
{{ .Values.image.registry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.widget.tag | default .Chart.AppVersion }}
{{- end }}