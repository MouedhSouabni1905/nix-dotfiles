{config, pkgs, ...}:

{

environment.systemPackages = with pkgs; [
                obsidian
                wiki-tui
                bashcards
                d2

        ];

}
