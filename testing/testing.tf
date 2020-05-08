module "wordpress-oregon" {

source = "nadirkakoev/asg/aws"

region = "us-west-2"

image_owner = "137112412989" //AWS AMI

desired_capacity = 1

max_size = 1

min_size = 1

}