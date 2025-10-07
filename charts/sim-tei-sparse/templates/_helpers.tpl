{{/*
Expand the name of the chart.
*/}}
{{- define "sim-tei-sparse.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sim-tei-sparse.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sim-tei-sparse.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sim-tei-sparse.labels" -}}
helm.sh/chart: {{ include "sim-tei-sparse.chart" . }}
{{ include "sim-tei-sparse.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sim-tei-sparse.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sim-tei-sparse.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sim-tei-sparse.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sim-tei-sparse.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get image repository from global values or local values
*/}}
{{- define "sim-tei-sparse.image.repository" -}}
{{- if .Values.global.control.simTeiSparse.image.repository }}
{{- .Values.global.control.simTeiSparse.image.repository }}
{{- else }}
{{- .Values.image.repository }}
{{- end }}
{{- end }}

{{/*
Get image tag from global values or local values
*/}}
{{- define "sim-tei-sparse.image.tag" -}}
{{- if .Values.global.control.simTeiSparse.image.tag }}
{{- .Values.global.control.simTeiSparse.image.tag }}
{{- else }}
{{- .Values.image.tag | default .Chart.AppVersion }}
{{- end }}
{{- end }}
