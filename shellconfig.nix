{config, pkgs, ...}:

let

omzplugins =  [
        "colored-man-pages"
        "colorize"
        "copybuffer"
        "copyfile"
        "extract"
        "jsontools"
        "rake-fast"
        "safe-paste"
        "sudo"
];

aliases = {
        ll = "ls -l";
        ".." = "cd ..";
        la = "ls -a";
};

in

{

programs.zellij.enable = true;
programs.zsh.enable = true;
programs.zsh.autosuggestion.enable = true;
programs.zsh.enableVteIntegration = true;
programs.zsh.shellAliases = aliases;
programs.zsh.oh-my-zsh.enable = true;
programs.zsh.oh-my-zsh.plugins = omzplugins;  
programs.zsh.oh-my-zsh.theme = "candy";
programs.zellij.enableZshIntegration = true;
programs.zsh.initContent = ''
                export BARTIB_FILE=~/.timetrack
        '';

}
