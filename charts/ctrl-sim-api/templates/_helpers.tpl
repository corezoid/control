{{/*
Common labels
*/}}
{{- define "ctrl-sim-api.labels" -}}
{{ include "control.appLabels" . }}
tier: {{ .Values.appName | quote }}
release: {{ .Release.Name | quote }}
api: "true"
chart: {{ include "control.fullname" . | quote }}
{{- end }}

{{- define "ctrl-sim-api.port" -}}
{{- default .Values.global.control.ctrlSimApiPort .Values.ctrlSimApiPort }}
{{- end }}

{{/*
Image url
*/}}
{{- define "ctrl-sim-api.imageUrl" -}}
{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.ctrl_sim_api.tag | default .Chart.AppVersion }}
{{- end }}

{{- define "control.ctrl-sim-api.annotations" -}}
{{- with .Values.global.control.ctrl_sim_api.annotations }}
{{ toYaml . | trim | indent 4 }}
{{- end }}
{{- end }}

{{/*
Readiness
*/}}
{{- define "ctrl-sim-api.readiness" -}}
readinessProbe:
  httpGet:
    scheme: HTTP
    path: /health/readiness
    port: {{ include "ctrl-sim-api.port" . }}
  initialDelaySeconds: 20
  periodSeconds: 5
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}

{{/*
Liveness
*/}}
{{- define "ctrl-sim-api.liveness" -}}
livenessProbe:
  httpGet:
    scheme: HTTP
    path: /health/liveness
    port: {{ include "ctrl-sim-api.port" . }}
  initialDelaySeconds: 25
  periodSeconds: 10
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}
