resource "proxmox_virtual_environment_vm" "fedora" {
  for_each        = var.vms
  name            = each.value.name
  node_name       = "vm03"
  stop_on_destroy = true

  cpu {
    cores = each.value.cores
  }

  memory {
    dedicated = each.value.memory
  }

  disk {
    datastore_id = "local-lvm"
    import_from  = proxmox_download_file.fedora_cloud_image.id
    interface    = "scsi0"
    size         = each.value.disk
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    user_account {
      # do not use this in production, configure your own ssh key instead!
      username = var.vm_username
      password = var.vm_password
    }
    ip_config {
      ipv4 {
        address = each.value.ip
        gateway = each.value.gateway
      }
    }
    dns {
      servers = each.value.dns_servers
    }
    # dns {
    #   servers = [
    #     "192.168.5.5",
    #     "192.168.5.1"
    #     ]
    # }
  }
}

resource "proxmox_download_file" "fedora_cloud_image" {
  content_type = "import"
  datastore_id = "local"
  node_name    = "vm03"
  url          = "https://download.fedoraproject.org/pub/fedora/linux/releases/44/Cloud/x86_64/images/Fedora-Cloud-Base-Generic-44-1.7.x86_64.qcow2"
  file_name    = "Fedora-Cloud-Base-Generic-44-1.7.x86_64.qcow2"
}