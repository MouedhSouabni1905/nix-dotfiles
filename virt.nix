{config, pkgs, ...} :

{

boot.binfmt.emulatedSystems = [
        "aarch64-linux"
];

boot.kernelModules = [
        "kvm"
        "kvm_arm"
];

virtualisation = {
  libvirtd = {
    enable = true;
  };
};

environment.systemPackages = with pkgs; [
  # For virt-install
  virt-manager
  
  qemu

  # For lsusb
  usbutils
];

# Access to libvirtd
users.users.lubbaragaki = {
  extraGroups = ["libvirtd"];
};

}
