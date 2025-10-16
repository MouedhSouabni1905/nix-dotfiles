{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
                neofetch
                vencord
                vesktop
                obs-studio
                ani-cli
                gimp
                inkscape
        ];

}
