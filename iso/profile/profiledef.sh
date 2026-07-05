#!/usr/bin/env bash

iso_name="gayos"
iso_label="GAYOS_$(date +%Y%m)"
iso_publisher="GayOS <https://os.18.io.vn/gayos>"
iso_application="GayOS Live/Rescue ISO"
iso_version="0.1.0"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/usr/local/bin/gayos-live"]="0:0:755"
)
