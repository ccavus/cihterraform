# ======================== #
# VMware VMs configuration #
# ======================== #

#vm-count = 2
vm_name = "cihtst"
vm_template_name = "template_ubuntu22"
vm_cpu = 1
vm_ram = 1024
vm_guest_id = "ubuntu64Guest"
vm_ipv4_netmask	 = "24"
vm_ipv4_gateway	 = "192.168.0.1"
vm_dns_servers = ["8.8.8.8", "8.8.4.4"]
vm_domain = "host.vmadmin.local"

vms = {
  cihtst02 = {
    name                = "cihtst02"
    vm_ip               = "192.168.0.171"
  },
  cihtst03 = {
    name                = "cihtst03"
    vm_ip               = "192.168.0.172"
  }
}

# ============================ #
# VMware vSphere configuration #
# ============================ #

# VMware vCenter IP/FQDN
vsphere-vcenter = "192.168.0.201"

# VMware vSphere username used to deploy the infrastructure
vsphere-user = "awxuser@vsphere.local"

# VMware vSphere password used to deploy the infrastructure
vsphere-password = "Fenerbahce1907"

# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"

# vSphere datacenter name where the infrastructure will be deployed
vsphere-datacenter = "cihdc"

# vSphere cluster name where the infrastructure will be deployed
vsphere-cluster = "cihcluster"

# vSphere Datastore used to deploy VMs 
vm-datastore = "ds-cihvmdata01"

# vSphere Network used to deploy VMs 
vm-network = "VM Network"

# Linux virtual machine domain name
vm-domain = "home.vmadmin.local"
