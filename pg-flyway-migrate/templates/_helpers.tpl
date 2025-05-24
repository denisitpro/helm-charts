{{/*
Return the full name of the resource.
*/}}
{{- define "pg-flyway-migrate.fullname" -}}
{{- if .Values.nameOverride }}
{{- .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-migrate" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}