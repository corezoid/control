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
{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.frontend.tag | default .Chart.AppVersion }}
{{- end }}


{{- define "control.frontend.nginx.client_max_body_size" -}}
{{ printf "%dm" (div .Values.global.control.webConfig.maxFileSize 1048576) }}
{{- end }}