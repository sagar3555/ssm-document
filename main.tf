module "rpa_ssm_document_domain_join" {
  source = "git::https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/terraform-module-ssmdocument.git?ref=v0.1.0"

  name            = local.domain_join_document_name
  content         = local.domain_join_content
  document_format = local.domain_join_document_format
  document_type   = local.domain_join_document_type
  tags            = var.tags
}
/*
module "rpa_ssm_document_domain_Unjoin" {
  source = "git::https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/terraform-module-ssmdocument.git?ref=v0.1.0"

  name            = local.domain_Unjoin_document_name
  content         = local.domain_Unjoin_content
  document_format = local.domain_Unjoin_document_format
  document_type   = local.domain_Unjoin_document_type
  tags            = var.tags
}

module "rpa_ssm_document_Test_domain_join" {
  source = "git::https://git-codecommit.eu-west-1.amazonaws.com/v1/repos/terraform-module-ssmdocument.git?ref=v0.1.0"

  name            = local.domain_Test_join_document_name
  content         = local.domain_Test_join_content
  document_format = local.domain_Test_join_document_format
  document_type   = local.domain_Test_join_document_type
  tags            = var.tags
}
*/
