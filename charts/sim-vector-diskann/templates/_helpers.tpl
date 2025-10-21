{{- define "sim-vector-diskann.labels" -}}
app.kubernetes.io/name: sim-vector-diskann
app.kubernetes.io/instance: {{ .Release.Name }}
tier: sim-vector-diskann
{{- end }}

{{/*
Image url - uses same tag as sim-vector
*/}}
{{- define "sim-vector-diskann.imageUrl" -}}
{{- $imageRegistry := .Values.global.control.sim_vector.imageRegistry | default .Values.global.imageRegistry -}}
{{- $repotype := .Values.global.control.sim_vector.repotype | default .Values.global.repotype -}}
{{ $imageRegistry }}/{{ $repotype }}/{{ .Values.image.repository }}:{{ .Values.global.control.sim_vector.tag | default .Chart.AppVersion }}
{{- end }}
