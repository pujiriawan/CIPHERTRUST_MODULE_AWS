#variable "vsphere_password" {
#  description = "vSphere login password"
#  type        = string
#  sensitive   = true
#}
#
#variable "vsphere_user" {
#  description = "vSphere login username"
#  type        = string
#  sensitive   = true
#}
#
#variable "vcenter_server" {
#  type = string
#  sensitive = true
#  description = "location of vcenter server"
#}
#
#variable "user_administrator_domain" {
#  type = string
#  sensitive = true
#  description = "user for domain account"
#}
#
#variable "password_administrator_domain" {
#  type = string
#  sensitive = true
#  description = "password for administrator domain account"
#}
#
#variable "local_administrator_pwd" {
#    type = string
#    sensitive = true
#    description = "password for administrator local account"
#}
#
#variable "script_path_prereq-ansible" {
#    type = string
#    description = "this is path for location of ansible prereq ansible"
#    default = ""
#}
#
#variable "script_path_priviledge-escalation" {
#    type = string
#    description = "this is path for location of ansible priviledge script"
#    default = ""
#}
#
variable "script_path_ansible" {
    type = string
    description = "this is path for location of ansible scripts"
    default = ""
}
#
#
#variable "command_prereq_ansible" {
#    type = string
#    description = "this is command will be run in prereq ansible"
#    default = ""
#}
#
#variable "command_priviledge-escalation" {
#    type = string
#    description = "this is command will be run in prereq priviledge escalation"
#    default = ""
#}
#
#variable "command_ansible_scripts" {
#    type = string
#    description = "this is command will be run in ansible scripts"
#    default = ""
#}
#
#variable "linux_machine" {
#  description = "This is will deploy 1 vm sas java api linux agent"
#  type = map(object({
#    vmname = string
#    cpu    = string
#    memory = string
#    ipaddress = string
#    
#  }))
#  default = {
#    "MSI-CADP-01" = {
#          vmname = "MSI-CADP-01"
#          cpu    = "2"
#          memory = "2048"
#          ipaddress = "192.168.234.107"
#    }
#  }
#}
#
#module "LINUX_MACHINE" {
#  source = "/Users/noni_princess/Documents/Information Security/Develop-Curriculum-Security-Engineer/06-DevSecOps/Infrastructure-as-Code/Private_Cloud/VMWARE/RedHat/linux-modules"
#  for_each = var.linux_machine
#  vmname = each.value.vmname
#  cpu = each.value.cpu
#  memory = each.value.memory
#  ipaddress = each.value.ipaddress
#  script_path_prereq-ansible = "/Users/noni_princess/Documents/Information Security/Develop-Curriculum-Security-Engineer/06-DevSecOps/Configuration-Management/scripts"
#  script_path_priviledge-escalation = "/Users/noni_princess/Documents/Information Security/Develop-Curriculum-Security-Engineer/06-DevSecOps/Configuration-Management"
#  script_path_ansible = "/Users/noni_princess/Documents/Information Security/Develop-Curriculum-Security-Engineer/06-DevSecOps/Configuration-Management"
#  command_prereq_ansible = "chmod +x ssh-fingerprint.sh; /bin/sh ssh-fingerprint.sh"
#  command_priviledge-escalation = "ansible-playbook priviledge_escalation.yml --extra-vars ansible_sudo_pass=$TF_VAR_devops_password"
#  command_ansible_scripts = "ansible-playbook CipherTrust_Demo_Sample_Banking_DPG.yml"
#  vsphere-datacenter = "DC-SUPARK"
#  vsphere-cluster = "CLTR-SUPARK"
#  vm-datastore = "EMC-DS1"
#  vm-template-name = "UBUNTU2004"
#}

module "ciphertrust" {
  source = "git::https://github.com/pujiriawan/CIPHERTRUST_MODULE_AWS"
  aws_region  = "us-east-1"
	ciphertrust_ami_id  = "ami-05e87dbee5527a679"
	infra_env  = "Development"
	name_instance  = "CTM-BTN"
	project_name  = "PoC-BTN_CM-CTS"
  file_path = "/Users/noni_princess/Documents/Information Security/Develop-Curriculum-Security-Engineer/06-DevSecOps/Configuration-Management/vars/nodeConnection.yml"
	script_path_ansible  = "/Users/noni_princess/Documents/Information Security/Develop-Curriculum-Security-Engineer/06-DevSecOps/Configuration-Management"
}