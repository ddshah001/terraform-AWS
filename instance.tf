resource "aws_instance" "test01"{
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"
    key_name = "${aws_key_pair.firstkey.key_name}"
    vpc_security_group_ids = [aws_security_group.public-allow-ssh.id]
    subnet_id = aws_subnet.main-public01.id

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

output "ip" {
  value = aws_instance.test01.public_ip
}