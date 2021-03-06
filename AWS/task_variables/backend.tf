terraform {
  required_version = "0.11.14"

  backend "s3" {
    bucket = "state-class-nadir" // backend saved in s3 instead of frontend 
    key    = "path/to/my/key"

    //dynamodb_table =  "state_class"          #enable or disable lockid for overwriting
    region = "us-east-1"
  }
}
