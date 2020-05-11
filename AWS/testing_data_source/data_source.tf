data "terraform_remote_state" "testing" {
  backend = "s3"

  config = {
    bucket = "state-class-nadir"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

output "testing" {
  value = "${data.terraform_remote_state.testing.vpc}"
}

output "hello" {
  value = "${data.terraform_remote_state.testing.public_subnets.2}"
}
