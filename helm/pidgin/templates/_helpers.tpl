{{/*
Expand the name of the chart.
*/}}
{{- define "pidgin.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pidgin.fullname" -}}
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
{{- define "pidgin.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pidgin.labels" -}}
helm.sh/chart: {{ include "pidgin.chart" . }}
{{ include "pidgin.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pidgin.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pidgin.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app: {{ include "pidgin.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pidgin.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pidgin.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Define ddEnabled
*/}}
{{- define "pidgin.ddEnabled" -}}
{{- if .Values.global }}
{{- .Values.global.ddEnabled }}
{{- else}}
{{- .Values.dataDog.enabled }}
{{- end }}
{{- end }}