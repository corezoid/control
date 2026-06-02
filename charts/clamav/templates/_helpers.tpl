{{- define "clamav.labels" -}}
app: {{ .Values.global.control.product }}
tier: {{ .Values.appName }}
{{- end }}
