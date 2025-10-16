{config, pkgs, ...}:

{

environmentsystemPackages = with pkgs; [
                vim
                neovim
                tldr
                python312
                ruby
                hare
                git
        ];

}
