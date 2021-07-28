############
#     S3   #
############

s3_kms_key_arn = "arn:aws:kms:eu-west-1:084013405741:key/7e69151d-60ed-4f31-b00c-51adf6f33ea6"

s3_tags  = {
  Environment                   = "PRE"
  Application                   = "xECM"
  Owner                         = "Hosting-AppContacts-XECM@solvay.com"
  Approver                      = "urbano.llamas@solvay.com"
  Operating_Hours               = "Continuously 24/7"
  SBS_Project_Code              = "IT10721"
  SBS_Owner_Service_Line        = "Data Solutions"
  SBS_Owner_Service_Line_Domain = "DATA SOLUTIONS - DOC-ARCHIVING"
  CBS_Code                      = "APP-Document management tool"
  WBS_Element                   = "NHA.PX21016.ISAO"
}

########################
#       ALB            #
########################

name                            = "alb-ew1-xecm-v-internal"
internal                        = true
load_balancer_type              = "application"
listener_port                   = "80"
listener_protocol               = "HTTP"
targetgroup_01                  = "alb-ew1-xecm-v-otcs"
targetgroup_port                = "80"
targetgroup_port1               = "8090"
targetgroup_port2               = "8080"
targetgroup_protocol            = "HTTP"
target_type                     = "instance"
healthy_threshold               = "5"
unhealthy_threshold             = "2"
interval                        = "30"
timeout                         = "5"
path_01                         = "/otcs/cs.exe"
health_check_port               = "traffic-port"
health_check_port1              = "8090"
health_check_port2              = "8080"
health_check_protocol           = "HTTP"
targetgroup_02                  = "alb-ew1-xecm-v-queueserver"
path_02                         = "/QueueServer"
targetgroup_03                  = "alb-ew1-xecm-v-otdsws"
path_03                         = "/otdsws"
targetgroup_04                  = "alb-ew1-xecm-v-archive"
path_04                         = "/archive"
target_group_id_01              = "i-094c0ea8981d959b7"
target_group_id_02              = "i-0c23bcc5c36e89fe3"
target_group_id_03              = "i-04ed6ce2b8e837848"
target_group_id_04              = "i-03a1dfe799d4fbe0c"
target_group_id_05              = "i-05afe8656a60ba137"
target_group_id_06              = "i-0ca7bf953bff7d85f"
target_group_id_07              = "i-04f77e1b7f72a9706"
target_group_id_08              = "i-02167d073fa1c36b3"
targetgroup_att_port            = "80"
targetgroup_att_port1           = "8090"
targetgroup_att_port2           = "8080"
vpc_security_group_ids          = []
xecm_availability_zone          = "az1"
xecm_availability_zone_1        = "az2"
sec_group_ingress_with_cidr_blocks  = [
  {
    cidr_blocks = "10.0.0.0/8,10.208.78.168/32,10.208.78.182/32,10.208.78.165/32,10.208.78.183/32"
    description = "HTTP access the ipaddress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  },
  {
    cidr_blocks = "10.208.78.166/32,10.208.78.181/32,10.208.78.170/32,10.208.78.168/32,10.208.78.165/32,10.208.78.182/32,10.208.78.183/32,10.208.78.184/32"
    description = "HTTps access to the ipaddress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  },
]
sec_group_egress_with_cidr_blocks = [
  {
    cidr_blocks = "0.0.0.0/0"
    description = "Allow all outbound internet access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  },
]
