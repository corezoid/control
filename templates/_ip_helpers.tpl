{{- define "control.nginx.filter_internal_ip" -}}
# Map to filter out internal IP addresses from X-Real-IP header
map $remote_addr $safe_real_ip {
    # Default to the remote address
    default $remote_addr;
    
    # Filter out private IP ranges (RFC 1918)
    "~^10\." "filtered-internal-ip";
    "~^172\.(1[6-9]|2[0-9]|3[0-1])\." "filtered-internal-ip";
    "~^192\.168\." "filtered-internal-ip";
    
    # Filter loopback addresses
    "~^127\." "filtered-internal-ip";
}
{{- end }}
