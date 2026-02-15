output "Jenkins_ec2_public_ip" {

  value = module.Jenkins_ec2.public_ip

}

output "Jenkins_ec2_dns" {
  value = module.Jenkins_ec2.public_dns

}