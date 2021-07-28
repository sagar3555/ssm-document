locals {
  domain_join_document_name   = "Ec2WindowsDomainJoin"
  domain_join_content         = file("${path.module}/domain_join.yaml")
  domain_join_document_format = "YAML"
  domain_join_document_type   = "Command"

}
/*
locals {
  domain_Unjoin_document_name   = "Ec2WindowsDomainUnjoin-RPA"
  domain_Unjoin_content         = file("${path.module}/domain_Unjoin.yaml")
  domain_Unjoin_document_format = "YAML"
  domain_Unjoin_document_type   = "Command"

}

locals {
  domain_Test_join_document_name   = "TestDomainjoin-RPA"
  domain_Test_join_content         = file("${path.module}/Test_domain_join.yaml")
  domain_Test_join_document_format = "YAML"
  domain_Test_join_document_type   = "Command"

}
*/
