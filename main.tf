

resource "tls_private_key" "pscloud-tls-key" {
  algorithm     = "RSA"
  rsa_bits      = 4096
}

resource "aws_key_pair" "pscloud-generated-key" {
  key_name      = "${var.pscloud_company}_key_${var.pscloud_purpouse}"
  public_key    = tls_private_key.pscloud-tls-key.public_key_openssh
}

resource "local_file" "pscloud-ssh-key" {
  content       = tls_private_key.pscloud-tls-key.private_key_pem
  filename      = "${var.pscloud_key_path}${var.pscloud_company}_key_${var.pscloud_purpouse}.pem"
}