resource "aws_instance" "test01"{
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.firstkey.key_name}"
    vpc_security_group_ids = [aws_security_group.public-allow-ssh.id]
    subnet_id = aws_subnet.main-public01.id
    user_data = data.template_cloudinit_config.cloudinit-example.rendered
    tags = {
      Name = "test01"
    }

    provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    }
    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
    }
    provisioner "local-exec" {
      command = "echo ${aws_instance.test01.private_ip}>> private_ips.txt"
    }
    connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_PRIVATE_KEY)
    }
}

resource "aws_ebs_volume" "ebs_test01_vol01" {
    availability_zone = aws_subnet.main-public01.availability_zone
    size = 20
    type = "gp2"
    tags = {
      Name = "ebs_test01_vol01"
    }
  
}

resource "aws_volume_attachment" "ebs_test01_vol01_attachment" {
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id = aws_ebs_volume.ebs_test01_vol01.id
  instance_id = aws_instance.test01.id
  
}

output "ip" {
  value = aws_instance.test01.public_ip
}