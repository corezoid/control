{{- define "mf-api.labels" -}}
app.kubernetes.io/name: mf-api
app.kubernetes.io/instance: {{ .Release.Name }}
tier: mf-api
{{- end }}

{{/*
Image url
*/}}
{{- define "mf-api.imageUrl" -}}
{{- $mf_api_data := index .Values.global.control "mf-api" -}}
{{- $imageRegistry := $mf_api_data.imageRegistry | default .Values.global.imageRegistry -}}
{{- $repotype := $mf_api_data.repotype | default .Values.global.repotype -}}
{{- $repository := "" -}}
{{- if $mf_api_data.image -}}
{{- $repository = $mf_api_data.image.repository | default .Values.image.repository -}}
{{- else -}}
{{- $repository = .Values.image.repository -}}
{{- end -}}
{{ $imageRegistry }}/{{ $repotype }}/{{ $repository }}:{{ $mf_api_data.tag | default .Chart.AppVersion }}
{{- end }}

{{/*
Secret name for mf-api credentials
*/}}
{{- define "mf-api.secretName" -}}
{{- $mf_api_data := index .Values.global.control "mf-api" -}}
{{- .Release.Name }}-{{ $mf_api_data.secret.name }}
{{- end }}

{{/*
claude-code-api base url. Defaults to the in-cluster service of the
claude-code-api subchart, so a deployment that runs both needs no override.
*/}}
{{- define "mf-api.ccApiBaseUrl" -}}
{{- $mf_api_data := index .Values.global.control "mf-api" -}}
{{- (($mf_api_data.ccApi | default dict).baseUrl) | default "http://claude-code-api-service:8000" }}
{{- end }}
