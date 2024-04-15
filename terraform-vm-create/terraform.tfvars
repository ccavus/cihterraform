#Provider
vsphere_user = "awxuser@vsphere.local"
vsphere_password = "Fenerbahce1907"
vsphere_server = "192.168.0.201"

#Infrastructure
vsphere_datacenter = "cihdc"
vsphere_host = "192.168.0.200"
vsphere_compute_cluster = "cihcluster"
vsphere_datastore = "ds-cihvmdata01"
vsphere_network = "VM Network"

#VM
vm_template_name = "template_ubuntu22"
vm_guest_id = "ubuntu64Guest"
vm_vcpu	= "1"
vm_memory	= "1024"
vm_ipv4_netmask	 = "24"
vm_ipv4_gateway	 = "192.168.0.1"
vm_dns_servers = ["8.8.8.8", "8.8.4.4"]
vm_disk_label  = "disk0"
vm_disk_size  = "20"
vm_disk_thin = "true"
vm_domain	= "host.vmadmin.local"
vm_firmware = "efi"

vms = {
  cihtst02 = {
    name                = "cihtst02"
    vm_ip               = "192.168.0.171"
  },
  cihtst02 = {
    name                = "cihtst02"
    vm_ip               = "192.168.0.172"
  }
}