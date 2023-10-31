{{/*
Common labels
*/}}
{{- define "control-tasks.labels" -}}
{{ include "control.appLabels" . }}
tier: {{ .Values.appName | quote }}
release: {{ .Release.Name | quote }}
chart: {{ include "control.fullname" . }}
{{- end }}

{{/*
Image url
*/}}
{{- define "control-tasks.imageUrl" -}}
{{ .Values.image.registry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.control_tasks.tag | default .Chart.AppVersion }}
{{- end }}

{{- define "control.control-tasks.annotations" -}}
{{- with .Values.global.control.control_tasks.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
{{- end }}

{{/*
Readiness
*/}}
{{- define "control-tasks.readiness" -}}
readinessProbe:
  httpGet:
    scheme: HTTP
    path: {{ .Values.appReadinessHttpPath }}
    port: {{ .Values.appReadinessHttpPort }}
  initialDelaySeconds: 10
  periodSeconds: 5
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}

{{/*
Liveness
*/}}
{{- define "control-tasks.liveness" -}}
livenessProbe:
  httpGet:
    scheme: HTTP
    path: {{ .Values.appLivenessHttpPath }}
    port: {{ .Values.appReadinessHttpPort }}
  initialDelaySeconds: 15
  periodSeconds: 10
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}

{{- define "control.token" -}}
{{ .Values.global.control.superAdminApiKeyPrifix | default "mst_" }}{{ .Values.global.control.superAdminApiKey }}
{{- end -}}

{{- define "control.tasks.configmap.name" -}}
{{ .Values.appName }}-configmap
{{- end -}}

{{- define "control.tasks.app.configFullPath" -}}
{{ .Values.configPath }}/{{ .Values.configName }}
{{- end -}}
