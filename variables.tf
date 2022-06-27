variable "object_prefix" {
  type        = string
  description = "Unique name to prefix all objects with"
}

variable "dns_fqdn" {
  type        = any
  description = "DNS FQDN of the application"
}

variable "dns_zone" {
  type        = string
  description = "DNS Zone name of the application"
}

variable "namespace" {
  type        = string
  description = "Environment that the application will be deployed in"
}

variable "service_name" {
  type        = string
  description = "Service to target"
}
variable "service_port" {
  type        = number
  description = "Port for the ingress"
  default     = 80
}

variable "ingress_class" {
  type        = string
  description = "Ingress class to use"
  default     = "traefik"
}

variable "ingress_annotations" {
  type        = map(string)
  description = "Annotations to add to ingress"
  default     = {}
}

variable "tls_enabled" {
  type        = bool
  description = "Enable TLS on ingress"
  default     = true
}

variable "dns_record_ttl" {
  type        = number
  description = "TTL for DNS records"
  default     = 600
}

variable "cert_issuer_type" {
  type        = string
  description = "Issuer type for cert-manager"
  default     = "issuer"
}

variable "cert_issuer_name" {
  type        = string
  description = "Issuer name for cert-manager"
  default     = "self-signed"
}

variable "labels" {
  type        = map(string)
  description = "labels to add to ingress"
  default     = {}
}
