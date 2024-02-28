variable "ec2_tags" {
    type=map(any)
    description="MAp of ec2 tags" 
     
}
variable "vpc_id"{
    type=string
    description="Vpc id to receive form vpc"
}
variable "vpc_public_subnet_id"{
    type=string
    description="public subnet in vpc id"
}
variable "vpc_private_subnet_id"{
    type=string
    description="private subnet in vpc id"
}