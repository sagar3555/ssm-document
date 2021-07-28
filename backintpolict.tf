locals {
  shared_account_state_bucket_name = "s3-ew1-solvay-p-shared-terraform-states"

  account_environment = {
    prod     = "prod"
    pre_prod = "prod"
    nonprod  = "nonprod"
    archive  = "nonprod"
    qa       = "nonprod"
    staging  = "nonprod"
    dev      = "nonprod"
    DEV      = "nonprod"
  }

  account_key = "${var.region}/workloads/sap/sdlc/dev/terraform.tfstate"
}

data "terraform_remote_state" "account" {
  backend = "s3"

  config = {
    bucket   = "${local.shared_account_state_bucket_name}"
    key      = "${local.account_key}"
    region   = "${var.region}"
    role_arn = "arn:aws:iam::243274418888:role/${var.role_name}"
  }
}

locals {
  availability_zones = {
    AZ1 = 0
    AZ2 = 1
  }
}

data "aws_iam_policy_document" "read_domain_join_credentials_ssm_parameters" {
  statement {
    effect = "Allow"
    actions = [
      "ssm:Describe*",
      "ssm:Get*",
      "ssm:List*"
    ]
    resources = [
      "arn:aws:ssm:${var.region}:${var.account_id}:parameter/domain_join_*"
    ]
  }
}

data "aws_iam_policy" "ec2_role_for_ssm_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

// SSM Association resource needs ssm:GetParameter permission, which AmazonEC2RoleforSSM doesn't have (has ssm:GetParameters though)
data "aws_iam_policy" "ssm_read_only_access_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}

locals{
  ## FSX ##
  fsx_security_group_ingress_cidr = [
    {
      description = "udp access from solvay network on port 53"
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      cidr_blocks = var.internal_network_cidr
    },
    
    
    {
      description = "tcp access from solvay network on port 445"
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 464"
      from_port   = 464
      to_port     = 464
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 636"
      from_port   = 636
      to_port     = 636
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 3268"
      from_port   = 3268
      to_port     = 3268
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 3269"
      from_port   = 3269
      to_port     = 3269
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 9389"
      from_port   = 9389
      to_port     = 9389
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 49152 to 65535"
      from_port   = 49152
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr      
    },
    {
      description = "WinRM 2.0 from Solvay Network"
      from_port   = 5985
      to_port     = 5985
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
  ]
  fsx_security_group_ingress_sg = []
  fsx_security_group_egress = [
    {
      description = "udp access from solvay network on port 53"
      from_port   = 53
      to_port     = 53
      protocol    = "udp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "udp access from solvay network on port 88"
      from_port   = 88
      to_port     = 88
      protocol    = "udp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "udp access from solvay network on port 123"
      from_port   = 123
      to_port     = 123
      protocol    = "udp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "udp access from solvay network on port 389"
      from_port   = 389
      to_port     = 389
      protocol    = "udp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "udp access from solvay network on port 464"
      from_port   = 464
      to_port     = 464
      protocol    = "udp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 53"
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 88"
      from_port   = 88
      to_port     = 88
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 135"
      from_port   = 135
      to_port     = 135
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 389"
      from_port   = 389
      to_port     = 389
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 445"
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 464"
      from_port   = 464
      to_port     = 464
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 636"
      from_port   = 636
      to_port     = 636
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 3268"
      from_port   = 3268
      to_port     = 3268
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 3269"
      from_port   = 3269
      to_port     = 3269
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 9389"
      from_port   = 9389
      to_port     = 9389
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    },
    {
      description = "tcp access from solvay network on port 49152 to 65535"
      from_port   = 49152
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = var.internal_network_cidr
    }
  ]
}

data "aws_ssm_parameter" "dj_password" {
  name = "domain_join_password"
}

locals{
env_naming          = "ew1-sap-d"
}




#### Backint Policy 

data  "aws_iam_policy_document" "backint_policy" {
     statement {
        
      effect = "Allow"
      actions = [
                "s3:GetBucketPolicyStatus",
                "s3:GetBucketLocation",
                "s3:ListBucket",
                "s3:GetBucketAcl",
                "s3:GetBucketPolicy"
              ]
      resources  = ["arn:aws:s3:::*"] 
  }

  statement {
        
      effect = "Allow"
      actions = [
                "kms:Decrypt",
                "kms:GenerateDataKey"
              ]
      resources  = ["arn:aws:kms:eu-west-1:183313596187:key/04eff8da-5220-4423-a48e-bff4ec565019"] 
  }

  statement {
        
      effect = "Allow"
      actions = [
                "s3:PutObjectTagging",
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject"
              ]
      resources  = ["arn:aws:s3:::s3-ew1-sapbackup-d-0/*"] 
  }

}
