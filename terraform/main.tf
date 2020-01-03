module "ec2" {
  source                      = "./modules/ec2/"
  region                      = "us-east-1"
  instance_type               = "t2.micro"
  instance_count              = 1
  user_data                   = "${file("scripts/apache.sh")}"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${module.sg.id}"]
  key_name                    = "new"
  subnet_id                   = "${aws_subnet.mysubnet.*.id[0]}"
  ami_id                      = "${lookup(var.ami_id, var.region)}"
  iam_instance_profile        = "${aws_iam_instance_profile.test_profile.name}"
  partition_name              = "${var.partition_name}"

}

module "sg" {
  source         = "./modules/sg/"
  sg_name        = "ssh_http"
  vpc_id         = local.vpc_id
  port1          = 22
  port2          = 80
  protocol_name  = "tcp"
  env            = "${var.env}"
  cidr_blocks    = "0.0.0.0/0"
  partition_name = "${var.partition_name}"

}


resource "aws_iam_role" "test_role" {
  name = "${var.partition_name}-role-${var.env}"

  assume_role_policy = "${file("iam/assume-policy.json")}"
}

resource "aws_iam_policy" "policy" {
  name        = "${var.partition_name}-policy-${var.env}"
  path        = "/"
  description = "${var.partition_name} Policy"

  policy = "${file("iam/role-policy.json")}"
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "${var.partition_name}-attachment-${var.env}"
  roles      = ["${aws_iam_role.test_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "${var.partition_name}-profile-${var.env}"
  role = "${aws_iam_role.test_role.name}"
}
