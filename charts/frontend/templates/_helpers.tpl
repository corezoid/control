{{/*
Common labels
*/}}
{{- define "control.frontend.labels" -}}
{{ include "control.appLabels" . }}
tier: {{ .Values.appName }}
release: {{ .Release.Name }}
chart: {{ include "control.fullname" . }}
{{- end }}

{{/*
Image url
*/}}
{{- define "control.frontend.imageUrl" -}}
{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype }}/{{ .Values.image.repository }}:{{ .Values.global.control.frontend.tag | default .Chart.AppVersion }}
{{- end }}