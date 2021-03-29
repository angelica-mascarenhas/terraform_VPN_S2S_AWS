data "aws_vpc" "vpc" {
  tags = {
    Environment = var.tag_vpc
  }
}

data "aws_route_table" "rts" {
  vpc_id = data.aws_vpc.vpc.id

  filter {
    name   = "tag:Name"
    values = ["*pr*"]
  }
}

resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = data.aws_vpc.vpc.id
}

resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn = 65000  
  ip_address = var.ip_gw_remote
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
#Descomente preshared_key apenas se o cliente informar
#  tunnel1_preshared_key = "XXXXXXXXXXXXX"

    tags = {
       Name = var.vpn_name
  }
}

resource "aws_vpn_connection_route" "office" {
  destination_cidr_block = var.lan_remote
  vpn_connection_id      = aws_vpn_connection.main.id
}

resource "aws_vpn_gateway_route_propagation" "example" {
  vpn_gateway_id = aws_vpn_gateway.vpn_gateway.id
  route_table_id = data.aws_route_table.rts.id
}

