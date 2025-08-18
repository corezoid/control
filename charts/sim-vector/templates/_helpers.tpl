{{- define "sim-vector.labels" -}}
app.kubernetes.io/name: sim-vector
app.kubernetes.io/instance: {{ .Release.Name }}
tier: sim-vector
{{- end }}

{{/*
Image url
*/}}
{{- define "sim-vector.imageUrl" -}}
{{- $imageRegistry := .Values.global.control.sim_vector.imageRegistry | default .Values.global.imageRegistry -}}
{{- $repotype := .Values.global.control.sim_vector.repotype | default .Values.global.repotype -}}
{{ $imageRegistry }}/{{ $repotype }}/{{ .Values.image.repository }}:{{ .Values.global.control.sim_vector.tag | default .Chart.AppVersion }}
{{- end }}
