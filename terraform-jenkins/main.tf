# Below code creates a jenkins master's lauch configaration using pre baked ami which consist of jdk, jenkins and git
provider "aws" {
  region = "us-west-2"
}

resource "aws_launch_configuration" "master" {
  image_id        = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.master.id]
  depends_on      = [aws_security_group.master]
  user_data       = data.template_file.master_user_data.rendered
  root_block_device {
    volume_size = 20
  }
  ebs_block_device {
    volume_size = 100
    device_name = "/dev/xvdf"
  }
}

resource "aws_efs_file_system" "master" {
  creation_token = "JenkinsMaster"
  tags           = var.resources_tags
}

data "template_file" "master_user_data" {
  template = "${file("${path.module}/scripts/startup-master.sh.tpl")}"

  vars = {
    efs_dns_name = aws_efs_file_system.master.dns_name
  }
}

resource "aws_efs_mount_target" "master" {
  file_system_id  = aws_efs_file_system.master.id
  subnet_id       = element(var.private_subnet_ids, 0)
  security_groups = [aws_security_group.master-efs-storage.id]
}
