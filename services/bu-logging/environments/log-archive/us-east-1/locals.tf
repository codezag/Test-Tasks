locals {
  buckets = {
    for svc in var.services : svc => {
      name = "${var.prefix}-logs-${svc}"
      tag  = svc
      region = var.region
    }
  }
}
