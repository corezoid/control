{{- define "ufs.labels" -}}
app.kubernetes.io/name: ufs
app.kubernetes.io/instance: {{ .Release.Name }}
tier: ufs
{{- end }}

{{/*
Image url
*/}}
{{- define "ufs.imageUrl" -}}
{{- $imageRegistry := .Values.global.control.ufs.imageRegistry | default .Values.global.imageRegistry -}}
{{- $repotype := .Values.global.control.ufs.repotype | default .Values.global.repotype -}}
{{ $imageRegistry }}/{{ $repotype }}/{{ .Values.image.repository }}:{{ .Values.global.control.ufs.tag | default .Chart.AppVersion }}
{{- end }}

{{/*
Secret name for ufs credentials
*/}}
{{- define "ufs.secretName" -}}
{{- .Release.Name }}-{{ .Values.global.control.ufs.db.secret.name }}
{{- end }}