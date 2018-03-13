# =================================================================
# Copyright 2017 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License.
#	You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
#	WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================

# This is a terraform generated template generated from ibm_mq_v9_with_custom_mqsc

##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "ibm_pm_public_ssh_key_name" {
  description = "Public CAMC SSH key name used to connect to the virtual guest."
}

variable "ibm_pm_private_ssh_key" {
  description = "Private CAMC SSH key (base64 encoded) used to connect to the virtual guest."
}

variable "user_public_ssh_key" {
  type = "string"
  description = "User defined public SSH key used to connect to the virtual machine. The format must be in openSSH."
  default = "None"
}

variable "ibm_stack_id" {
  description = "A unique stack id."
}

##############################################################
# Define the ibm provider
##############################################################
#define the ibm provider
provider "ibm" {
  version = "~> 0.5"
}

provider "camc" {
  version = "~> 0.1"
}

##############################################################
# Reference public key in Devices>Manage>SSH Keys in SL console)
##############################################################
data "ibm_compute_ssh_key" "ibm_pm_public_key" {
  label = "${var.ibm_pm_public_ssh_key_name}"
  most_recent = "true"
}

##############################################################
# Define pattern variables
##############################################################
##### unique stack name #####
variable "ibm_stack_name" {
  description = "A unique stack name."
}


##### Environment variables #####
#Variable : ibm_pm_access_token
variable "ibm_pm_access_token" {
  type = "string"
  description = "IBM Pattern Manager Access Token"
}

#Variable : ibm_pm_service
variable "ibm_pm_service" {
  type = "string"
  description = "IBM Pattern Manager Service"
}

#Variable : ibm_sw_repo
variable "ibm_sw_repo" {
  type = "string"
  description = "IBM Software Repo Root (https://<hostname>:<port>)"
}

#Variable : ibm_sw_repo_password
variable "ibm_sw_repo_password" {
  type = "string"
  description = "IBM Software Repo Password"
}

#Variable : ibm_sw_repo_user
variable "ibm_sw_repo_user" {
  type = "string"
  description = "IBM Software Repo Username"
  default = "repouser"
}

#Variable : wmq_v9_install_wmq_data_dir
variable "wmq_v9_install_wmq_data_dir" {
  type = "string"
  description = "The directory to install IBM MQ Data files, recommended /var/mqm"
  default = "/var/mqm"
}

#Variable : wmq_v9_install_wmq_install_dir
variable "wmq_v9_install_wmq_install_dir" {
  type = "string"
  description = "The directory to install IBM MQ Binaries, recommended /opt/mqm"
  default = "/opt/mqm"
}

#Variable : wmq_v9_install_wmq_log_dir
variable "wmq_v9_install_wmq_log_dir" {
  type = "string"
  description = "The directory to install IBM MQ Log Directory, recommended -> node[wmq][data_dir]/log"
  default = "/var/mqm/log"
}

#Variable : wmq_v9_install_wmq_os_users_mqm_comment
variable "wmq_v9_install_wmq_os_users_mqm_comment" {
  type = "string"
  description = "Comment associated with the IBM MQ User"
  default = "MQseries User"
}

#Variable : wmq_v9_install_wmq_os_users_mqm_gid
variable "wmq_v9_install_wmq_os_users_mqm_gid" {
  type = "string"
  description = "Group ID of the Unix OS User for IBM MQ"
  default = "mqm"
}

#Variable : wmq_v9_install_wmq_os_users_mqm_home
variable "wmq_v9_install_wmq_os_users_mqm_home" {
  type = "string"
  description = "Home Directory of Default OS User for IBM MQ User."
  default = "/home/mqm"
}

#Variable : wmq_v9_install_wmq_os_users_mqm_ldap_user
variable "wmq_v9_install_wmq_os_users_mqm_ldap_user" {
  type = "string"
  description = "A flag which indicates whether to create the MQ USer locally, or utilise an LDAP based user."
}

#Variable : wmq_v9_install_wmq_os_users_mqm_name
variable "wmq_v9_install_wmq_os_users_mqm_name" {
  type = "string"
  description = "Name of the Unix OS User that owns and controls IBM MQ"
  default = "mqm"
}

#Variable : wmq_v9_install_wmq_os_users_mqm_shell
variable "wmq_v9_install_wmq_os_users_mqm_shell" {
  type = "string"
  description = "Location of the IBM MQ User Shell"
  default = "/bin/bash"
}

#Variable : wmq_v9_install_wmq_qmgr_dir
variable "wmq_v9_install_wmq_qmgr_dir" {
  type = "string"
  description = "The directory to install IBM MQ Queue Manager Directory, recommended node[wmq][data_dir]/qmgrs"
  default = "/var/mqm/qmgrs"
}


##### MQV9Node01 variables #####
#Variable : MQV9Node01-image
variable "MQV9Node01-image" {
  type = "string"
  description = "Operating system image id / template that should be used when creating the virtual image"
  default = "REDHAT_7_64"
}

#Variable : MQV9Node01-name
variable "MQV9Node01-name" {
  type = "string"
  description = "Short hostname of virtual machine"
}

#Variable : MQV9Node01-os_admin_user
variable "MQV9Node01-os_admin_user" {
  type = "string"
  description = "Name of the admin user account in the virtual machine that will be accessed via SSH"
}

#Variable : MQV9Node01_wmq_advanced
variable "MQV9Node01_wmq_advanced" {
  type = "string"
  description = "Install IBM MQ Advanced components: File Transfer, IBM MQ Telemetry, and Advanced Message Security."
  default = "false"
}

#Variable : MQV9Node01_wmq_fixpack
variable "MQV9Node01_wmq_fixpack" {
  type = "string"
  description = "The fixpack of IBM MQ to install."
  default = "2"
}

#Variable : MQV9Node01_wmq_net_core_rmem_default
variable "MQV9Node01_wmq_net_core_rmem_default" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_core_rmem_default"
  default = "10240"
}

#Variable : MQV9Node01_wmq_net_core_rmem_max
variable "MQV9Node01_wmq_net_core_rmem_max" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_core_rmem_max"
  default = "4194304"
}

#Variable : MQV9Node01_wmq_net_core_wmem_default
variable "MQV9Node01_wmq_net_core_wmem_default" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_core_wmem_default"
  default = "262144"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_fin_timeout
variable "MQV9Node01_wmq_net_ipv4_tcp_fin_timeout" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_fin_timeout"
  default = "60"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_keepalive_intvl
variable "MQV9Node01_wmq_net_ipv4_tcp_keepalive_intvl" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_keepalive_intvl"
  default = "75"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_keepalive_time
variable "MQV9Node01_wmq_net_ipv4_tcp_keepalive_time" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_keepalive_time"
  default = "7200"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_rmem
variable "MQV9Node01_wmq_net_ipv4_tcp_rmem" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_rmem"
  default = "4096    87380   4194304"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_sack
variable "MQV9Node01_wmq_net_ipv4_tcp_sack" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_sack"
  default = "1"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_timestamps
variable "MQV9Node01_wmq_net_ipv4_tcp_timestamps" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_timestamps"
  default = "1"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_window_scaling
variable "MQV9Node01_wmq_net_ipv4_tcp_window_scaling" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_window_scaling"
  default = "1"
}

#Variable : MQV9Node01_wmq_net_ipv4_tcp_wmem
variable "MQV9Node01_wmq_net_ipv4_tcp_wmem" {
  type = "string"
  description = "WebSphere MQ Server Kernel Configuration net_ipv4_tcp_wmem"
  default = "4096    87380   4194304"
}

#Variable : MQV9Node01_wmq_perms
variable "MQV9Node01_wmq_perms" {
  type = "string"
  description = "Default permissions for IBM MQ files on Unix"
  default = "755"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_description
variable "MQV9Node01_wmq_qmgr_qmgr1_description" {
  type = "string"
  description = "Description of the Queue Manager"
  default = "Default Queue Manager"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_dlq
variable "MQV9Node01_wmq_qmgr_qmgr1_dlq" {
  type = "string"
  description = "Queue Manager dead letter queue"
  default = "SYSTEM.DEAD.LETTER.QUEUE"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_listener_port
variable "MQV9Node01_wmq_qmgr_qmgr1_listener_port" {
  type = "string"
  description = "Port the Queue Manager listens on."
  default = "1414"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_loggingtype
variable "MQV9Node01_wmq_qmgr_qmgr1_loggingtype" {
  type = "string"
  description = "Type of logging to use ll(Linear), lc(Circular)"
  default = "lc"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_logsize
variable "MQV9Node01_wmq_qmgr_qmgr1_logsize" {
  type = "string"
  description = "Size of the IBM MQ Logs"
  default = "16384"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_name
variable "MQV9Node01_wmq_qmgr_qmgr1_name" {
  type = "string"
  description = "Name of the Queue Manager to Create"
  default = "QMGR1"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_primarylogs
variable "MQV9Node01_wmq_qmgr_qmgr1_primarylogs" {
  type = "string"
  description = "Number of primary logs to create."
  default = "10"
}

#Variable : MQV9Node01_wmq_qmgr_qmgr1_secondarylogs
variable "MQV9Node01_wmq_qmgr_qmgr1_secondarylogs" {
  type = "string"
  description = "Number of Secondary Logs"
  default = "20"
}

#Variable : MQV9Node01_wmq_service_name
variable "MQV9Node01_wmq_service_name" {
  type = "string"
  description = "WebSphere MQ service name"
  default = "mq"
}

#Variable : MQV9Node01_wmq_swap_file
variable "MQV9Node01_wmq_swap_file" {
  type = "string"
  description = "Swap file name"
  default = "/swapfile"
}

#Variable : MQV9Node01_wmq_swap_file_size
variable "MQV9Node01_wmq_swap_file_size" {
  type = "string"
  description = "UNIX Swap size in megabytes"
  default = "512"
}

#Variable : MQV9Node01_wmq_version
variable "MQV9Node01_wmq_version" {
  type = "string"
  description = "The Version of IBM MQ to install, eg, 8.0"
  default = "9.0"
}

#Variable : wmq_mqsc_script_url
variable "wmq_mqsc_script_url" {
  type = "string"
  description = "MQ Script Url Path"
  default = "none"
}


##### virtualmachine variables #####
#Variable : MQV9Node01-mgmt-network-public
variable "MQV9Node01-mgmt-network-public" {
  type = "string"
  description = "Expose and use public IP of virtual machine for internal communication"
  default = "true"
}


##### ungrouped variables #####
##### domain name #####
variable "runtime_domain" {
  description = "domain name"
  default = "cam.ibm.com"
}


#########################################################
##### Resource : MQV9Node01
#########################################################


#Parameter : MQV9Node01_datacenter
variable "MQV9Node01_datacenter" {
  type = "string"
  description = "IBMCloud datacenter where infrastructure resources will be deployed"
  default = "dal05"
}


#Parameter : MQV9Node01_private_network_only
variable "MQV9Node01_private_network_only" {
  type = "string"
  description = "Provision the virtual machine with only private IP"
  default = "false"
}


#Parameter : MQV9Node01_number_of_cores
variable "MQV9Node01_number_of_cores" {
  type = "string"
  description = "Number of CPU cores, which is required to be a positive Integer"
  default = "2"
}


#Parameter : MQV9Node01_memory
variable "MQV9Node01_memory" {
  type = "string"
  description = "Amount of Memory (MBs), which is required to be one or more times of 1024"
  default = "4096"
}


#Parameter : MQV9Node01_network_speed
variable "MQV9Node01_network_speed" {
  type = "string"
  description = "Bandwidth of network communication applied to the virtual machine"
  default = "1000"
}


#Parameter : MQV9Node01_hourly_billing
variable "MQV9Node01_hourly_billing" {
  type = "string"
  description = "Billing cycle: hourly billed or monthly billed"
  default = "true"
}


#Parameter : MQV9Node01_dedicated_acct_host_only
variable "MQV9Node01_dedicated_acct_host_only" {
  type = "string"
  description = "Shared or dedicated host, where dedicated host usually means higher performance and cost"
  default = "false"
}


#Parameter : MQV9Node01_local_disk
variable "MQV9Node01_local_disk" {
  type = "string"
  description = "User local disk or SAN disk"
  default = "false"
}

variable "MQV9Node01_root_disk_size" {
  type = "string"
  description = "Root Disk Size - MQV9Node01"
  default = "100"
}

resource "ibm_compute_vm_instance" "MQV9Node01" {
  hostname = "${var.MQV9Node01-name}"
  os_reference_code = "${var.MQV9Node01-image}"
  domain = "${var.runtime_domain}"
  datacenter = "${var.MQV9Node01_datacenter}"
  network_speed = "${var.MQV9Node01_network_speed}"
  hourly_billing = "${var.MQV9Node01_hourly_billing}"
  private_network_only = "${var.MQV9Node01_private_network_only}"
  cores = "${var.MQV9Node01_number_of_cores}"
  memory = "${var.MQV9Node01_memory}"
  disks = ["${var.MQV9Node01_root_disk_size}"]
  dedicated_acct_host_only = "${var.MQV9Node01_dedicated_acct_host_only}"
  local_disk = "${var.MQV9Node01_local_disk}"
  ssh_key_ids = ["${data.ibm_compute_ssh_key.ibm_pm_public_key.id}"]
  # Specify the ssh connection
  connection {
    user = "${var.MQV9Node01-os_admin_user}"
    private_key = "${base64decode(var.ibm_pm_private_ssh_key)}"
  }

  provisioner "file" {
    destination = "MQV9Node01_add_ssh_key.sh"
    content     = <<EOF
# =================================================================
# Copyright 2017 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License.
#	You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
#	WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================
#!/bin/bash

if (( $# != 2 )); then
    echo "usage: arg 1 is user, arg 2 is public key"
    exit -1
fi

userid=$1
ssh_key=$2

if [[ $ssh_key = 'None' ]]; then
  echo "skipping add, 'None' specified"
  exit 0
fi

user_home=$(eval echo "~$userid")
user_auth_key_file=$user_home/.ssh/authorized_keys
if ! [ -f $user_auth_key_file ]; then
  echo "$user_auth_key_file does not exist on this system"
  exit -1
else
  echo "user_home --> $user_home"
fi

echo $ssh_key >> $user_auth_key_file
if [ $? -ne 0 ]; then
  echo "failed to add to $user_auth_key_file"
  exit -1
else
  echo "updated $user_auth_key_file"
fi

EOF
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "bash -c 'chmod +x MQV9Node01_add_ssh_key.sh'",
      "bash -c './MQV9Node01_add_ssh_key.sh  \"${var.MQV9Node01-os_admin_user}\" \"${var.user_public_ssh_key}\">> MQV9Node01_add_ssh_key.log 2>&1'"
    ]
  }

}

#########################################################
##### Resource : MQV9Node01_byos-runmqsc
#########################################################

resource "null_resource" "MQV9Node01_byos-runmqsc" {
  depends_on = ["camc_softwaredeploy.MQV9Node01_wmq_create_qmgrs"]

  # Specify the ssh connection
  connection {
    user = "${var.MQV9Node01-os_admin_user}"
    private_key = "${base64decode(var.ibm_pm_private_ssh_key)}"
    host = "${var.MQV9Node01-mgmt-network-public == "false" ? ibm_compute_vm_instance.MQV9Node01.ipv4_address_private : ibm_compute_vm_instance.MQV9Node01.ipv4_address}"
  }

  provisioner "file" {
    destination = "MQV9Node01_byos-runmqsc.properties"
    content     = <<EOF
export wmq_mqsc_script_url="${var.wmq_mqsc_script_url}"

EOF
  }

  provisioner "file" {
    destination = "MQV9Node01_byos-runmqsc.sh"
    content     = <<EOF
#!/usr/bin/env sh

if [ "${var.wmq_mqsc_script_url}" != "none" ]; then
  curl -k -u ${var.ibm_sw_repo_user}:${var.ibm_sw_repo_password} -f -s ${var.wmq_mqsc_script_url} -o cust.mqsc
  if [ $? -eq 0 ]; then
    sudo -S -u mqm /opt/mqm/bin/runmqsc ${var.MQV9Node01_wmq_qmgr_qmgr1_name} < cust.mqsc > cust.mqsc.out
    exit 0
  else
    exit 1
  fi
else
  exit 0
fi

EOF
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "sudo bash -c 'chmod +x MQV9Node01_byos-runmqsc.properties'",
      "sudo bash -c '. ./MQV9Node01_byos-runmqsc.properties'",
      "sudo bash -c 'chmod +x MQV9Node01_byos-runmqsc.sh'",
      "sudo bash -c './MQV9Node01_byos-runmqsc.sh  >> MQV9Node01_byos-runmqsc.log 2>&1'",
      "sudo bash -c 'rm MQV9Node01_byos-runmqsc.properties'"
    ]
  }

}


#########################################################
##### Resource : MQV9Node01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "MQV9Node01_chef_bootstrap_comp" {
  depends_on = ["camc_vaultitem.VaultItem","ibm_compute_vm_instance.MQV9Node01"]
  name = "MQV9Node01_chef_bootstrap_comp"
  camc_endpoint = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.MQV9Node01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${var.MQV9Node01-mgmt-network-public == "false" ? ibm_compute_vm_instance.MQV9Node01.ipv4_address_private : ibm_compute_vm_instance.MQV9Node01.ipv4_address}",
  "node_name": "${var.MQV9Node01-name}",
  "node_attributes": {
    "ibm_internal": {
      "stack_id": "${var.ibm_stack_id}",
      "stack_name": "${var.ibm_stack_name}",
      "vault": {
        "item": "secrets",
        "name": "${var.ibm_stack_id}"
      }
    }
  }
}
EOT
}


#########################################################
##### Resource : MQV9Node01_wmq_create_qmgrs
#########################################################

resource "camc_softwaredeploy" "MQV9Node01_wmq_create_qmgrs" {
  depends_on = ["camc_softwaredeploy.MQV9Node01_wmq_v9_install"]
  name = "MQV9Node01_wmq_create_qmgrs"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.MQV9Node01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${var.MQV9Node01-mgmt-network-public == "false" ? ibm_compute_vm_instance.MQV9Node01.ipv4_address_private : ibm_compute_vm_instance.MQV9Node01.ipv4_address}",
  "node_name": "${var.MQV9Node01-name}",
  "runlist": "role[wmq_create_qmgrs]",
  "node_attributes": {
    "ibm": {
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[wmq_create_qmgrs]"
    },
    "wmq": {
      "qmgr": {
        "qmgr1": {
          "description": "${var.MQV9Node01_wmq_qmgr_qmgr1_description}",
          "dlq": "${var.MQV9Node01_wmq_qmgr_qmgr1_dlq}",
          "listener_port": "${var.MQV9Node01_wmq_qmgr_qmgr1_listener_port}",
          "loggingtype": "${var.MQV9Node01_wmq_qmgr_qmgr1_loggingtype}",
          "logsize": "${var.MQV9Node01_wmq_qmgr_qmgr1_logsize}",
          "name": "${var.MQV9Node01_wmq_qmgr_qmgr1_name}",
          "primarylogs": "${var.MQV9Node01_wmq_qmgr_qmgr1_primarylogs}",
          "secondarylogs": "${var.MQV9Node01_wmq_qmgr_qmgr1_secondarylogs}"
        }
      }
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}


#########################################################
##### Resource : MQV9Node01_wmq_v9_install
#########################################################

resource "camc_softwaredeploy" "MQV9Node01_wmq_v9_install" {
  depends_on = ["camc_bootstrap.MQV9Node01_chef_bootstrap_comp"]
  name = "MQV9Node01_wmq_v9_install"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.MQV9Node01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${var.MQV9Node01-mgmt-network-public == "false" ? ibm_compute_vm_instance.MQV9Node01.ipv4_address_private : ibm_compute_vm_instance.MQV9Node01.ipv4_address}",
  "node_name": "${var.MQV9Node01-name}",
  "runlist": "role[wmq_v9_install]",
  "node_attributes": {
    "ibm": {
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_auth": "true",
      "sw_repo_self_signed_cert": "true",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[wmq_v9_install]"
    },
    "wmq": {
      "advanced": "${var.MQV9Node01_wmq_advanced}",
      "data_dir": "${var.wmq_v9_install_wmq_data_dir}",
      "fixpack": "${var.MQV9Node01_wmq_fixpack}",
      "global_mq_service": "true",
      "install_dir": "${var.wmq_v9_install_wmq_install_dir}",
      "log_dir": "${var.wmq_v9_install_wmq_log_dir}",
      "net_core_rmem_default": "${var.MQV9Node01_wmq_net_core_rmem_default}",
      "net_core_rmem_max": "${var.MQV9Node01_wmq_net_core_rmem_max}",
      "net_core_wmem_default": "${var.MQV9Node01_wmq_net_core_wmem_default}",
      "net_ipv4_tcp_fin_timeout": "${var.MQV9Node01_wmq_net_ipv4_tcp_fin_timeout}",
      "net_ipv4_tcp_keepalive_intvl": "${var.MQV9Node01_wmq_net_ipv4_tcp_keepalive_intvl}",
      "net_ipv4_tcp_keepalive_time": "${var.MQV9Node01_wmq_net_ipv4_tcp_keepalive_time}",
      "net_ipv4_tcp_rmem": "${var.MQV9Node01_wmq_net_ipv4_tcp_rmem}",
      "net_ipv4_tcp_sack": "${var.MQV9Node01_wmq_net_ipv4_tcp_sack}",
      "net_ipv4_tcp_timestamps": "${var.MQV9Node01_wmq_net_ipv4_tcp_timestamps}",
      "net_ipv4_tcp_window_scaling": "${var.MQV9Node01_wmq_net_ipv4_tcp_window_scaling}",
      "net_ipv4_tcp_wmem": "${var.MQV9Node01_wmq_net_ipv4_tcp_wmem}",
      "os_users": {
        "mqm": {
          "comment": "${var.wmq_v9_install_wmq_os_users_mqm_comment}",
          "gid": "${var.wmq_v9_install_wmq_os_users_mqm_gid}",
          "home": "${var.wmq_v9_install_wmq_os_users_mqm_home}",
          "ldap_user": "${var.wmq_v9_install_wmq_os_users_mqm_ldap_user}",
          "name": "${var.wmq_v9_install_wmq_os_users_mqm_name}",
          "shell": "${var.wmq_v9_install_wmq_os_users_mqm_shell}"
        }
      },
      "perms": "${var.MQV9Node01_wmq_perms}",
      "qmgr_dir": "${var.wmq_v9_install_wmq_qmgr_dir}",
      "service_name": "${var.MQV9Node01_wmq_service_name}",
      "swap_file": "${var.MQV9Node01_wmq_swap_file}",
      "swap_file_size": "${var.MQV9Node01_wmq_swap_file_size}",
      "version": "${var.MQV9Node01_wmq_version}"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}


#########################################################
##### Resource : VaultItem
#########################################################

resource "camc_vaultitem" "VaultItem" {
  camc_endpoint = "${var.ibm_pm_service}/v1/vault_item/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "vault_content": {
    "item": "secrets",
    "values": {},
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

output "MQV9Node01_ip" {
  value = "Private : ${ibm_compute_vm_instance.MQV9Node01.ipv4_address_private} & Public : ${ibm_compute_vm_instance.MQV9Node01.ipv4_address}"
}

output "MQV9Node01_name" {
  value = "${var.MQV9Node01-name}"
}

output "MQV9Node01_roles" {
  value = "wmq_create_qmgrs,wmq_v9_install"
}

output "stack_id" {
  value = "${var.ibm_stack_id}"
}
