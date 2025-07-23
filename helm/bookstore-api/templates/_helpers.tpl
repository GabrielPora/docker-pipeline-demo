{{- define "bookstore-api.name" -}}
bookstore-api
{{- end }}

{{- define "bookstore-api.fullname" -}}
{{ printf "%s" (include "bookstore-api.name" .) }}
{{- end }}