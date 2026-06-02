{{- define "claude-code-api.labels" -}}
app.kubernetes.io/name: claude-code-api
app.kubernetes.io/instance: {{ .Release.Name }}
tier: claude-code-api
{{- end }}

{{/*
Image url
*/}}
{{- define "claude-code-api.imageUrl" -}}
{{- $repo := ((.Values.global.control.claude_code_api.image).repository) | default (printf "%s/%s" (.Values.global.repotype | default "public") .Values.image.repository) -}}
{{ .Values.global.imageRegistry }}/{{ $repo }}:{{ .Values.global.control.claude_code_api.tag | default .Chart.AppVersion }}
{{- end }}

{{/*
PostgreSQL secret name for claude-code-api
*/}}
{{- define "claude-code-api.postgresSecretName" -}}
{{- .Release.Name }}-{{ .Values.global.control.claude_code_api.db.secret.name }}
{{- end }}