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
{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.realtime.tag | default .Chart.AppVersion }}
{{- end }}

{{- define "control.realtime.metrics_port" -}}
{{ .Values.global.control.realtimeMetricsPort | default 9100 }}
{{- end -}}

{{- define "control.realtime.configmap.name" -}}
{{ .Values.appName }}-configmap
{{- end -}}

{{- define "control.realtime.app.configFullPath" -}}
{{ .Values.configPath }}/{{ .Values.configName }}
{{- end -}}
