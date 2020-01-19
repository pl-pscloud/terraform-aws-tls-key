output "pscloud_key_name" {
  value       = aws_key_pair.pscloud-generated-key.key_name
}

output "pscloud_key_path" {
  value       = local_file.pscloud-ssh-key.filename
}