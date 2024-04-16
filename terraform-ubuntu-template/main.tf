# =================== #
# Deploying VMware VM #
# =================== #
terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }
}

# Connect to VMware vSphere vCenter
provider "vsphere" {
  vim_keep_alive = 30
  user           = var.vsphere-user
  password       = var.vsphere-password
  vsphere_server = var.vsphere-vcenter

  # If you have a self-signed cert
  allow_unverified_ssl = var.vsphere-unverified-ssl
}

# Define VMware vSphere 
data "vsphere_datacenter" "dc" {
  name = var.vsphere-datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vm-datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere-cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vm-network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/${var.vm_template_name}"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Create VMs
#resource "vsphere_virtual_machine" "vm" {
#  count = var.vm-count

#  name             = "${var.vm-name}-${count.index + 1}"
resource "vsphere_virtual_machine" "vm" {
  for_each = var.vms 

  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  name = each.value.name
  num_cpus = var.vm_cpu
  memory   = var.vm_ram
  guest_id = var.vm_guest_id
  
  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
#    label = "${var.vm_name}-${count.index + 1}-disk"
    label = "${var.vm_name}-disk"
    thin_provisioned = false
    eagerly_scrub = false
    size  = 25
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = each.value.name
        #host_name = "${var.vm-name}-${count.index + 1}"
        domain    = var.vm-domain
      }     
      network_interface {
        ipv4_address	= each.value.vm_ip
        ipv4_netmask	= var.vm_ipv4_netmask
        dns_server_list	= var.vm_dns_servers
      }
      ipv4_gateway = var.vm_ipv4_gateway
      timeout = 30
    }
  }
}
