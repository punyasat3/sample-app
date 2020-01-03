resource "aws_security_group" "allow_ssh_http" {
  name        = "${var.sg_name}"
  description = "Allow ${var.sg_name} traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "${var.port1}"
    to_port     = "${var.port1}"
    protocol    = "${var.protocol_name}"
    cidr_blocks = "${var.cidr_blocks}"
  }
  ingress {
    from_port   = "${var.port2}"
    to_port     = "${var.port2}"
    protocol    = "${var.protocol_name}"
    cidr_blocks = "${var.cidr_blocks}"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.partition_name}-${var.sg_name}-${var.env}"
  }
}


output "sg_id" {
  value = "${aws_security_group.allow_ssh_http.id}"
}
