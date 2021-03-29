variable "ip_gw_remote" {
    default = "X.X.X.X"
}

variable "lan_remote" {
    default = "192.168.0.0/24"
}

variable "tag_vpc" {
    type = string
    default = "production"
}
variable "vpn_name" {
  default = "VPN_S2S"
}