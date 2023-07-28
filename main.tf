# Generate an SSH key. Required to setup CipherTrust Manager Instance.
resource "tls_private_key" "ciphertrust_ssh_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

# Creating an instance of CipherTrust Manager Community Edition on AWS
# Referece create AMI using this guide : https://thalesdocs.com/ctp/cm/2.7/get_started/deployment/virtual-deployment/aws-deployment/index.html
resource "aws_instance" "ciphertrust_aws" {
    ami = var.ciphertrust_ami_id
    instance_type = "t2.xlarge"   # Recommended Size
    vpc_security_group_ids = [aws_security_group.ciphertust_network_firewall.id]
    subnet_id = aws_subnet.ciphertust_network_public_subnet.id
    tags = {
            Name = "${var.aws_region}-${var.name_instance}"
            Project     = var.project_name
            Environment = var.infra_env
            ManagedBy   = "terraform"
        }
    
    root_block_device {
      volume_size = 100   # Recommended size to run CipherTrust Manager in production
      volume_type = "gp2"   # For higher volume transactions, you might want to update the type of EBS volume.
    }
}


# This is ansible playbook will call ansible collection create by Thales Team https://github.com/thalescpl-io/CDSP_Orchestration
resource "null_resource" "change_initial_password" {
    depends_on = [aws_instance.ciphertrust_aws]
    provisioner "local-exec" {
    working_dir = var.script_path_ansible
    command = "sleep 600; ansible-playbook resetInitialPassword.yml"
    }
  }


resource "null_resource" "inject_license" {
    depends_on = [null_resource.change_initial_password]
    provisioner "local-exec" {
    working_dir = var.script_path_ansible
    command = "ansible-playbook ciphertrust_inject_license.yml"
    #command = "echo 'Succesfully Deploy Ciphertrust Manager'"
    }
  }