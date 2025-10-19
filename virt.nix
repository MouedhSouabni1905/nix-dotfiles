{config, pkgs, ...} :

{
virtualisation = {
  libvirtd = {
    enable = true;
    # Used for UEFI boot of Home Assistant OS guest image
    # qemuOvmf = true;
  };
};

environment.systemPackages = with pkgs; [
  # For virt-install
  virt-manager

  # For lsusb
  usbutils
];

# Access to libvirtd
users.users.lubbaragaki = {
  extraGroups = ["libvirtd"];
};

}
