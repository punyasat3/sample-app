resource "aws_instance" "web" {
  count                       = "${var.instance_count}"
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_id}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = "${var.vpc_security_group_ids}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  user_data                   = "${var.user_data}"

  tags = {
    Name = "${var.partition_name}-${var.env}"
  }
}
