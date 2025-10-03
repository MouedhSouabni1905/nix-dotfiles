# Edit this configuration file to define what should be installed on

# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
  	"obsidian"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # making zsh into the default shell
  environment.shells = with pkgs; [ zsh bash ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  environment.variables.EDITOR = "nvim";
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
        #  services.xserver.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  #services.desktopManager.plasma6.enable = true;
  programs.hyprland.enable = true; # enable Hyprland

# Configure keymap in X11
        #services.xserver.xkb = {
                #layout = "us";
                #variant = "";
                #};

# Enable CUPS to print documents.
services.printing.enable = true;

hardware.pulseaudio.enable = false;

# Enable sound with pipewire.
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
enable = true;
alsa.enable = true;
alsa.support32Bit = true;
pulse.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;

# use the example session manager (no others are packaged yet so this is enabled by default,
# no need to redefine it in your config for now)
#media-session.enable = true;
};

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.lubbaragaki = {
isNormalUser = true;
description = "Mouedh Souabni";
extraGroups = [ "networkmanager" "wheel" ];
packages = with pkgs; [
kdePackages.kate
kdePackages.dolphin
];
};

programs.neovim.enable = true;
programs.nvf = {
enable = true;
settings = {
        vim = {
                theme.enable = true;
                theme.name = "gruvbox";
                theme.style = "dark";

                languages = {
                        enableLSP = true;
                        enableTreesitter = true;

                        nix.enable = true;
                        clang.enable = true;
                        php.enable = true;
                        html.enable = true;
                        python.enable = true;
                        ruby.enable = true;
                        css.enable = true;
                        ts.enable = true;
                };
                telescope.enable = true;
                binds.cheatsheet.enable = true;
                presence.neocord.enable = true;
                utility.oil-nvim.enable = true;
                keymaps = [
                        {
                                key = "th";
                                mode = ["n"];
                                action = ":bo term<CR>";
                                silent = true;
                                desc = "Open a terminal below";      
}
                        {
                                key = "tv";
                                mode = ["n"];
                                action = ":vert term<CR>";
                                silent = true;
                                desc = "Open a terminal on the side (right side)";      
}
                        {
                                key = "ff";
                                mode = ["n"];
                                action = ":Telescope find_files<CR>";
                                silent = true;
                                desc = "Find files in current directory using telescope";      
}
                        {
                                key = "fg";
                                mode = ["n"];
                                action = ":Telescope find_files<CR>";
                                silent = true;
                                desc = "Find files in current directory using telescope";      
}
                        {
                                key = "fb";
                                mode = ["n"];
                                action = ":Telescope live_grep<CR>";
                                silent = true;
                                desc = "Find lines in current directory using telescope";      
}
                        {
                                key = "fh";
                                mode = ["n"];
                                action = ":Telescope help_tags<CR>";
                                silent = true;
                                desc = "Find help tags";      
}
                        {
                                key = "mo";
                                mode = ["n"];
                                action = ":Oil --float<CR>";
                                silent = true;
                                desc = "Open Oil-nvim as a floating window in the current directory";      
}
];
};
};
};

environment.variables = {
};

# List packages installed in system profile. To search, run:
# $ nix search wget
environment.systemPackages = with pkgs; [
vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
wget
git
hare
neovim
fzf
perf
valgrind
btop
neofetch
vencord
vesktop
ruby
gcc
gpp
tree
librewolf
pavucontrol
python312
curl
ani-cli
zellij
bat
pstree
pamixer
obs-studio
xdg-desktop-portal-hyprland
xdg-desktop-portal-gtk
quickshell
zsh
alacritty
rofi
slurp
grim
chroma
wl-clipboard
tldr
obsidian
unzip
gimp
inkscape
ncdu
phototonic
vlc
];



# Optional, hint Electron apps to use Wayland:
# environment.sessionVariables.NIXOS_OZONE_WL = "1";

nix.settings.experimental-features = ["nix-command" "flakes"];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "25.05"; # Did you read the comment?

}
