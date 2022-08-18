{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "helm-bridge.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "helm-bridge.labels" -}}
helm.sh/chart: {{ include "helm-bridge.chart" . }}
{{ include "helm-bridge.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "helm-bridge.selectorLabels" -}}
app.kubernetes.io/name: {{ include "helm-bridge.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
