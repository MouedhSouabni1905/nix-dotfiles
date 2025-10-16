{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
                zsh
                zellij
                btop
                fzf
                pstree
                bat

        ];

}
