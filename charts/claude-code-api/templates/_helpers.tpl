{{- define "claude-code-api.labels" -}}
app.kubernetes.io/name: claude-code-api
app.kubernetes.io/instance: {{ .Release.Name }}
tier: claude-code-api
{{- end }}

{{/*
Image url
*/}}
{{- define "claude-code-api.imageUrl" -}}
{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.claude_code_api.tag | default .Chart.AppVersion }}
{{- end }}
