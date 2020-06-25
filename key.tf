resource "aws_key_pair" "firstkey" {
  key_name = "firstkey"
  public_key = "${file("${var.PATH_PUBLIC_KEY}")}"
}