module "bs4_1" {
  source = "git::https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/terraform-module-ec2singleaz.git?ref=v0.2.4"

  # Common variables
  instance_tags         = merge(var.bs4_1_tags, var.bs4_1_instance_tags, var.bs4_1_migrated_tags)
  network_tags          = var.bs4_1_tags
  iam_tags              = var.bs4_1_tags
  volume_tags           = merge(var.bs4_1_tags, var.bs4_1_migrated_tags)
  environment_shortname = var.environment_shortname
  region                = var.region
  region_shortname      = var.region_shortname
  application_name      = var.bs4_1_application_name
  host_name             = var.bs4_1_host_name

  # Security group variables
  sg_vpc_id                   = data.terraform_remote_state.account.outputs.vpc_id
  sg_description              = var.bs4_1_sg_description
  sg_ingress_with_self        = var.bs4_1_sg_ingress_with_self
  sg_ingress_with_cidr_blocks = var.bs4_1_sg_ingress_with_cidr_blocks
  sg_ingress_prefix_list_ids  = var.bs4_1_sg_ingress_prefix_list_ids
  sg_egress_with_self         = var.bs4_1_sg_egress_with_self
  sg_egress_with_cidr_blocks  = var.bs4_1_sg_egress_with_cidr_blocks
  sg_egress_prefix_list_ids   = var.bs4_1_sg_egress_prefix_list_ids

#Ec2 Iam policy content commented out 
#{
#name   = "bs4_1ReadDomainJoinCredentialsSsmParametersPolicy"
#policy = "${data.aws_iam_policy_document.read_domain_join_credentials_ssm_parameters.json}"
#}

  # EC2 variables
  ec2_iam_policies = []
  ec2_managed_arn_policies = ["${data.aws_iam_policy.ec2_role_for_ssm_policy.arn}"]
  ec2_ami                  = var.bs4_1_ec2_ami
  ec2_ebs_optimized        = var.bs4_1_ec2_ebs_optimized
  ec2_instance_type        = var.bs4_1_ec2_instance_type
  ec2_key_name             = "ec2-ew1-d-sapdevsystems-v2"
  ec2_monitoring           = var.bs4_1_ec2_monitoring
  #ec2_subnet_id = "subnet-0f067083c3924d025"
  ec2_subnet_id            = element(data.terraform_remote_state.account.outputs.private_subnets, local.availability_zones[upper(var.bs4_1_availability_zone)])
  ec2_vpc_security_group_ids = [
    module.cytecsg.id,
    #data.terraform_remote_state.account.outputs.domain_member_security_group_id,
    data.terraform_remote_state.account.outputs.tpa_security_group_id,
    module.efssg.id,
    module.sapendusr.id
  ]
  ec2_private_ip        = var.bs4_1_ec2_private_ip
  ec2_user_data         = var.bs4_1_ec2_user_data
  ec2_volume_tags       = merge(var.bs4_1_tags, var.bs4_1_ec2_volume_tags)
  ec2_root_block_device = var.bs4_1_ec2_root_block_device
  ec2_ebs_volumes       = var.bs4_1_ebs_volumes
  #ec2_ssm_document_name = "Ec2WindowsDomainJoin"
  #ec2_ssm_parameters    = "${merge(var.ec2_domain_join_ssm_parameters, { hostname : var.bs4_1_domain_host_name })}"
  ec2_record_name       = var.bs4_1_ec2_record_name
  ec2_record_type       = var.bs4_1_ec2_record_type
  ec2_record_zone_id    = data.terraform_remote_state.account.outputs.private_hosted_zone_id
}
