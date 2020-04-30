resource "aws_iam_user" "nick" {
  name = "nick"
  path = "/"
}


resource "aws_iam_group" "developers3" {
  name = "test_group"
  path = "/"
}


resource "aws_iam_group_membership" "developers_team" {
  name = "developers-group-membership"
  users = [
    "${aws_iam_user.nick.name}"
  ]
  group = "${aws_iam_group.developers3.name}"

}
