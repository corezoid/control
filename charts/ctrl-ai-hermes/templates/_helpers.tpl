{{/*
Hermes is addressed by name from sim-api's config.ai (hermes.origin, hermes.shards:
<name>-<N>.<name>-headless.<namespace>.svc.cluster.local), and its StatefulSet's PVC is named after it
(state-<name>-0): the name stays sim-ai-hermes, the one the stands ran before the chart had Hermes.
*/}}
{{- define "ctrl-ai-hermes.name" -}}
{{- .Values.global.control.ctrl_ai_hermes.name | default "sim-ai-hermes" }}
{{- end }}

{{/*
Selector: the StatefulSet's is immutable, so it is only `app` — what the stands' StatefulSet already has.
*/}}
{{- define "ctrl-ai-hermes.selectorLabels" -}}
app: {{ include "ctrl-ai-hermes.name" . | quote }}
{{- end }}

{{- define "ctrl-ai-hermes.labels" -}}
{{ include "ctrl-ai-hermes.selectorLabels" . }}
tier: "ctrl-ai-hermes"
release: {{ .Release.Name | quote }}
chart: {{ include "control.fullname" . | quote }}
{{- end }}

{{- define "ctrl-ai-hermes.imageUrl" -}}
{{- $h := .Values.global.control.ctrl_ai_hermes -}}
{{ .Values.global.imageRegistry }}/{{ $h.repotype | default .Values.global.repotype | default "public" }}/{{ $h.image.repository | default "ctrl-ai-hermes" }}:{{ $h.tag | default .Chart.AppVersion }}
{{- end }}

{{/* "true" when global.control.ctrl_ai_hermes.enabled; nested ifs, so it renders without the key too */}}
{{- define "ctrl-ai-hermes.enabled" -}}
{{- if hasKey .Values.global.control "ctrl_ai_hermes" }}{{ if .Values.global.control.ctrl_ai_hermes.enabled }}true{{ end }}{{ end }}
{{- end }}
