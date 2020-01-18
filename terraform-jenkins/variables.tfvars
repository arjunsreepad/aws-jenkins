instance_type      = "t2.micro"
ami_id             = "ami-08fafaa474896faf2"
key_name           = "enterprise-jenkins"
vpc_id             = "vpc-0ae1ed879ac9a2cdc"
vpc_cidr           = ["10.0.0.0/16"]
ssh_allowed_cidr   = ["10.0.0.0/16"]
private_subnet_ids = ["subnet-0e62d0a10de165691", "subnet-0faf580679d665dd0", "subnet-00d396e9727a668e7"]
public_subnet_ids  = ["subnet-068f52ac5d6963f06", "subnet-00bac09c0bffd3f16", "subnet-00ae28f7188b84169"]
resources_tags = {
  CostCenter  = "DevOps Team"
  Name        = "Enterprise-Jenkins",
  Application = "Jenkins"
}

