{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
                ffmpeg
                pavucontrol
                librewolf
                pamixer
                alacritty
                rofi
                grim
                wl-clipboard
                unzip
                ncdu
                phototonic
                vlc
                slurp
                detox
                backdown
                # distrobox => for VMs
                # bocker => for VMs
                pdftk
        ];

}
