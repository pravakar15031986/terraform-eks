variable "env" {
  type        = string
  default     = "rituali-prod"
  description = "prod Environment"
}

variable "k8s-ver" {
  default     = "1.32"  #upgrade instead of 1.30
  description = "K8s Version"
}

variable "region" {
  type        = string
  default     = "eu-north-1"
  description = "rituali prod Stockholm Region"
}

variable "db_snapshot_id" {
  type    = string
  default = "snap-ritual-prod-rds-16032025"
}
