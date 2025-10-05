{config, pkgs, ...}:

{

        programs.quickshell.enable = true;
        programs.quickshell.activeConfig = "/home/lubbaragaki/.dotfiles/qsapps";
        programs.quickshell.systemd.enable = true;

}
