## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |



# terraform-aws-vpn

Criação de VPN Site to site na AWS

# Pré Requisitos AWS

- VPC criada na AWS
- Criar tag Environment na vpc com valor desejado

# Ajustes terraform

- Adicione id da conta AWS no arquivo main.tf
- Altere os valores nas variaveis dentro do arquivo "variables.tf"

ip_gw_remote = ip de GW do equipamento remoto
lan_remote = range de comunicação interna da rede remota 
tag_vpc = Adicionar o valor da tag Environment
vpn_name = Nome da VPN

## Como criar

terraform init 

terraforma plan

terraforma apply
