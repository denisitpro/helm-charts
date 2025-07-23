{{/*
Return chart name.
*/}}
{{- define "certificate-cert-manager.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end }}

{{/*
Return chart version.
*/}}
{{- define "certificate-cert-manager.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end }}

{{/*
Common labels
*/}}
{{- define "certificate-cert-manager.labels" -}}
app.kubernetes.io/name: {{ include "certificate-cert-manager.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "certificate-cert-manager.chart" . }}
{{- end }}

{{/*
Return the target namespace
*/}}
{{- define "common.names.namespace" -}}
{{- if .Values.namespaceOverride }}
{{- .Values.namespaceOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Namespace }}
{{- end }}
{{- end }}
{{/*
Return the CronJob name
*/}}
{{- define "common.names.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end }}

{{/*
Return full name only when explicitly needed (e.g. PVC/SA)
*/}}
{{- define "common.names.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Standard common labels used across objects
*/}}
{{- define "common.labels.standard" -}}
app.kubernetes.io/name: {{ include "common.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}