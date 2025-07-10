version = "2023.7.20250623.1"
os_name          = "amazon"
os_version       = "2023"
os_arch          = "x86_64"
iso_url          = "https://cdn.amazonlinux.com/al2023/os-images/2023.7.20250623.1/kvm/al2023-kvm-2023.7.20250623.1-kernel-6.1-x86_64.xfs.gpt.qcow2 "
iso_checksum     = "file:https://cdn.amazonlinux.com/al2023/os-images/2023.7.20250623.1/kvm/SHA256SUMS"
shutdown_command = "echo 'vagrant' | sudo -S /sbin/halt -h -p"
box_name         = "al2023"

# Do not resize the cloud image
resize_cloud_image = false

# Send cloud-init data via cdrom
cd_files = [
  "./packer_templates/http/amazon/meta-data",
  "./packer_templates/http/amazon/network-config",
  "./packer_templates/http/amazon/user-data",
]
cd_label = "cidata"
