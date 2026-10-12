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
{{- $s := include "ufs.secretValues" . | fromYaml -}}
{{- .Release.Name }}-{{ $s.name | default "ufs-secret" }}
{{- end }}

{{/*
UFS secret values: global.control.ufs.secret, or the legacy
global.control.ufs.db.secret when it is set (values written before 0.3.77)
*/}}
{{- define "ufs.secretValues" -}}
{{- $ufs := .Values.global.control.ufs -}}
{{- $s := $ufs.secret | default dict -}}
{{- if and (hasKey $ufs "db") $ufs.db (hasKey $ufs.db "secret") $ufs.db.secret -}}
{{- $s = $ufs.db.secret -}}
{{- end -}}
{{- toYaml $s -}}
{{- end }}
