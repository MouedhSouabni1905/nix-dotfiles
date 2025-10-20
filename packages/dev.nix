{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
                vim
                neovim
                tldr
                python312
                ruby
                hare
                git
                ripgrep
                hyperfine
        ];

}
