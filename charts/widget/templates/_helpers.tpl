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
{{- /* AWS Marketplace: image.registry + image.repository + image.tag win when image.registry is set */ -}}
{{ if (.Values.image).registry }}{{ .Values.image.registry }}{{ else }}{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype | default "public" }}{{ end }}/{{ .Values.image.repository }}:{{ (.Values.image).tag | default (.Values.global.control.widget.tag | default .Chart.AppVersion) }}
{{- end }}

{{- define "control.widget.annotations" -}}
{{- with .Values.global.control.widget.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
{{- end }}
