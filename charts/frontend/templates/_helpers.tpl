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
{{- /* AWS Marketplace: image.registry + image.repository + image.tag win when image.registry is set */ -}}
{{ if (.Values.image).registry }}{{ .Values.image.registry }}{{ else }}{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype | default "public" }}{{ end }}/{{ .Values.image.repository }}:{{ (.Values.image).tag | default (.Values.global.control.frontend.tag | default .Chart.AppVersion) }}
{{- end }}


{{- define "control.frontend.nginx.client_max_body_size" -}}
{{ printf "%dm" (div .Values.global.control.webConfig.maxFileSize 1048576) }}
{{- end }}

{{- define "control.frontend.annotations" -}}
{{- with .Values.global.control.frontend.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
{{- end }}
