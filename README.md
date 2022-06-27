# Terraform Kubernetes Ingress

This terraform module deploys an ingress on kubernetes, updates DNS (PowerDNS)
and adds to monitoring (Icinga2).

## Deployment

```
module "ingress" {
  source           = "ballj/ingress/kubernetes"
  version          = "~> 1.0"
  namespace        = "production"
  object_prefix    = "nginx"
  dns_fqdn         = "nginx.example.com"
  dns_zone         = "example.com"
  service_name     = "nginx"
  service_port     = 80
  cert_issuer_type = "cluster-issuer"
  cert_issuer_name = "self-signed"
  labels           = {
    "app.kubernetes.io/name"     = "nginx"
    "app.kubernetes.io/instance" = "latest"
    "app.kubernetes.io/part-of"  = "nginx"
  }
}
```

## Providers

This module uses the following Terraform providers:
 - [pan-net/PowerDNS](https://registry.terraform.io/providers/pan-net/powerdns/latest/docs)
 - [Kubernetes](https://registry.terraform.io/providers/hashicorp/kubernetes/latest)

## Variables

| Variable              | Required | Default          | Description                                        |
| --------------------- | -------- | -------          | -------------------------------------------------- |
| `object_prefix`       | Yes      | N/A              | Unique name to prefix all objects with             |
| `dns_fqdn`            | Yes      | N/A              | FQDN of the application - list or string           |
| `dns_zone`            | Yes      | N/A              | DNS zone name                                      |
| `namespace`           | Yes      | N/A              | Kubernetes namespace to deploy ingress into        |
| `service_name`        | Yes      | N/A              | Service name for backend                           |
| `service_port`        | No       | N/A              | Service port to use for backend                    |
| `ingress_class`       | No       | `traefik`        | Kubernetes ingress class annotation                |
| `ingress_annotations` | No       | `{}`             | Annotations to add to ingress                      |
| `tls_enabled`         | No       | `true`           | Enable TLS on the ingress                          |
| `dns_record_ttl`      | No       | `600`            | TTL for DNS record                                 |
| `cert_issuer_type`    | No       | `issuer`         | Cert-Manager issuer type                           |
| `cert_issuer_name`    | No       | `self-signed`    | Cert-Manager issuer name                           |

## Outputs

This module does not have any outputs

### FQDN

The ingress host is set by the variable `dns_fqdn`. This can be either a sting:

```
module "ingress" {
  dns_fqdn         = "www.example.com"
}
```

or a list:

```
module "ingress" {
  dns_fqdn         = ["www1.example.com", "www2.example.com"]
}
```
