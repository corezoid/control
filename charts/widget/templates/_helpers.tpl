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
{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.widget.tag | default .Chart.AppVersion }}
{{- end }}

{{- define "control.widget.annotations" -}}
{{- with .Values.global.control.widget.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
{{- end }}
