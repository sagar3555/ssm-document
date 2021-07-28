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
