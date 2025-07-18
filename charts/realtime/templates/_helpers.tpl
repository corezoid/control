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

{{- define "control.realtime.redis.pool" -}}
{{- if .Values.global.control.realtime.config -}}
{{- if .Values.global.control.realtime.config.redis -}}
{{- if .Values.global.control.realtime.config.redis.pool -}}
{{- with .Values.global.control.realtime.config.redis.pool -}}
pool:
  max: {{ .max | default 200 }}
  idle: {{ .idle | default 30000 }}
{{- end }}
{{- else }}
pool:
  max: 200
  idle: 30000
{{- end -}}
{{- end -}}
{{- else }}
pool:
  max: 200
  idle: 30000
{{- end -}}
{{- end -}}

{{- define "control.realtime.redisPubSub.pool" -}}
{{- if .Values.global.control.realtime.config -}}
{{- if .Values.global.control.realtime.config.redis -}}
{{- if .Values.global.control.realtime.config.redis.pool -}}
{{- with .Values.global.control.realtime.config.redis.pool -}}
pool:
  max: {{ .max | default 200 }}
  idle: {{ .idle | default 30000 }}
{{- end }}
{{- else }}
pool:
  max: 200
  idle: 30000
{{- end -}}
{{- end -}}
{{- else }}
pool:
  max: 200
  idle: 30000
{{- end -}}
{{- end -}}

{{- define "control.realtime.annotations" -}}
{{- with .Values.global.control.realtime.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
{{- end }}
