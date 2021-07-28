###### S3  #### 
variable  "s3_kms_key_arn" {
  description  = "key for  encryption "
  type  = string
} 

variable  "s3_tags" {
   description = "tag values"
   type        = map(string)
}


###################
## ELB Variables ##
###################
variable "name" {
  description   = "Name of the load balancer"
  type          = string
}                            
variable "internal" {
  description    = "describe whether we use internal or internet facing LB"
  type           = bool
}
variable "load_balancer_type" {
  description    = "Type of Load balancer"
  type           = string
}
variable "listener_port" {
  description    = "Port on with LB listen"
  type           = string
}                   
variable "listener_protocol" {
  description    = "Protocol on which LB Listen"
  type           = string
}               
variable "targetgroup_01" {
  description    = "Name of the target group"
  type           = string
}                  
variable "targetgroup_port" {
  description   = "Port on which target group listen"
  type          = string
}  
variable "targetgroup_port1" {
  description   = "Port on which target group listen"
  type          = string
}  
variable "targetgroup_port2" {
  description   = "Port on which target group listen"
  type          = string
}               
variable "targetgroup_protocol" {
  description   = "Target group protocol"
  type          = string
}           
variable "target_type" {
  description   = "Target type of the target group"
  type          = string
}                     
variable "healthy_threshold" {
  description   = "Define healthy threshold of the target group"
  type          = string
}             
variable "unhealthy_threshold" {
  description   = "Define unhealthy threshold of the target group"
  type          = string
}               
variable "interval" {
  description    = "Define the interval"
  type           = string
}                     
variable "timeout" {
  description   = "Define the timeout"
  type          =  string
}                        
variable "path_01" {
  description    = "Path for the health check"
  type           = string
}
variable "health_check_port" {
  description     = "health check port"
  type            = string
}         
variable "health_check_port1" {
  description     = "health check port"
  type            = string
}    
variable "health_check_port2" {
  description     = "health check port"
  type            = string
}  
variable "health_check_protocol" {
  description     = "health check protocol"
  type            = string
}          
variable "targetgroup_02" {
  description     = "Name of the target group 2"
  type            = string
}
variable "path_02" {
  description    = "Path for the health check"
  type           = string
}                         
variable "targetgroup_03" {
  description     = "Name of the target group 3"
  type            = string
}                  
variable "path_03" {
  description    = "Path for the health check"
  type           = string
}                        
variable "targetgroup_04" {
  description     = "Name of the target group 4"
  type            = string
}                  
variable "path_04" {
  description    = "Path for the health check"
  type           = string
}                         
variable "target_group_id_01" {
  description   = "Instance id of the target group"
  type          = string
}
variable "target_group_id_02" {
  description   = "Instance id of the target group"
  type          = string
}             
variable "target_group_id_03" {
  description   = "Instance id of the target group"
  type          = string
}             
variable "target_group_id_04" {
  description   = "Instance id of the target group"
  type          = string
}            
variable "target_group_id_05" {
  description   = "Instance id of the target group"
  type          = string
}              
variable "target_group_id_06" {
  description   = "Instance id of the target group"
  type          = string
}             
variable "target_group_id_07" {
  description   = "Instance id of the target group"
  type          = string
}          
variable "target_group_id_08" {
  description   = "Instance id of the target group"
  type          = string
}          
variable "targetgroup_att_port" {
  description   = "port of the target group attachment"
  type          = string
}         
variable "targetgroup_att_port1" {
  description   = "port of the target group attachment"
  type          = string
} 
variable "targetgroup_att_port2" {
  description   = "port of the target group attachment"
  type          = string
} 
variable "sec_group_ingress_with_cidr_blocks" {
  description = "inbound rule of the security group"
  type        = list(map(string))
}
variable "sec_group_egress_with_cidr_blocks" {
  description = "outbound rule of the security group"
  type        = list(map(string))
} 
variable "xecm_availability_zone" {
  description = "avaiablity zone of the subnet"
  type        = string
}
variable "xecm_availability_zone_1" {
  description = "avaiablity zone of the subnet"
  type        = string
}
variable "vpc_security_group_ids" {
  description = "VPC security groups"
  type        = list(map(string))
}
