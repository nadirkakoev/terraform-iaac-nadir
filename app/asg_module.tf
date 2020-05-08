module "app" {
  source = "./module"
  region = "us-east-1"
}

module "ohio" {
source = "./module"
region = "us-east-2"
}

module "oregon" {
source = "./module"
region = "us-west-2"
}

module "london" {
source = "./module"
region = "eu-west-2"
}


