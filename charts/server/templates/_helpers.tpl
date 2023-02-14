{{/*
Common labels
*/}}
{{- define "server.labels" -}}
{{ include "control.appLabels" . }}
tier: {{ .Values.appName | quote }}
release: {{ .Release.Name | quote }}
api: "true"
chart: {{ include "control.fullname" . }}
{{- end }}

{{/*
Image url
*/}}
{{- define "server.imageUrl" -}}
{{ .Values.global.imageRegistry }}/{{ .Values.global.repotype | default "public" }}/{{ .Values.image.repository }}:{{ .Values.global.control.server.tag | default .Values.image.version }}
{{- end }}

{{/*
Readiness
*/}}
{{- define "server.readiness" -}}
readinessProbe:
  httpGet:
    scheme: HTTP
    path: /api/sa/1.0/check/readiness
    port: {{ .Values.global.control.serverPort }}
  initialDelaySeconds: 10
  periodSeconds: 5
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}

{{/*
Liveness
*/}}
{{- define "server.liveness" -}}
livenessProbe:
  tcpSocket:
    port: {{ .Values.global.control.serverPort }}
  initialDelaySeconds: 15
  periodSeconds: 10
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3
{{- end }}